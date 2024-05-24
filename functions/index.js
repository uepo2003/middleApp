
const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp();


exports.onBookChange = functions.firestore
    .document("users/{userId}/books/{bookId}")
    .onWrite(async (change, context) => {
      const userId = context.params.userId;
      const bookId = context.params.bookId;
      const newValue = change.after.exists ? change.after.data() : null;
      if (newValue) {
        await admin.firestore().collection("allUsersBooks").doc(bookId).set({
          uid: userId,
          banned: false,
          ...newValue,
        });
      } else {
        await admin.firestore().collection("allUsersBooks")
            .doc(bookId).delete();
      }
    });

exports.addBook = functions.https.onCall(async (data) => {
  const userId = data.userId;
  const bookId = data.bookId;
  const title = data.title;
  const description = data.description;
  const imageUrl = data.imageUrl;
  const url = data.url;
  const createdAt = new Date(data.createdAt);
  const updatedAt = new Date(data.updatedAt);


  await admin.firestore().runTransaction(async (transaction) => {
    const userRef = admin.firestore().collection("users").doc(userId);
    const bookRef = userRef.collection("books").doc(bookId);

    transaction.set(bookRef, {
      bookId: bookId,
      title: title,
      description: description,
      imageUrl: imageUrl,
      url: url,
      createdAt: createdAt,
      updatedAt: updatedAt});
    transaction.update(userRef, {bookCount: admin.firestore
        .FieldValue.increment(1)});
  });

  return {message: "Book added successfully"};
});

exports.removeBook = functions.https.onCall(async (data) => {
  const userId = data.userId;
  const bookId = data.bookId;

  await admin.firestore().runTransaction(async (transaction) => {
    const userRef = admin.firestore().collection("users").doc(userId);
    const bookRef = userRef.collection("books").doc(bookId);

    transaction.delete(bookRef);
    transaction.update(userRef, {bookCount:
      admin.firestore.FieldValue.increment(-1)});
  });

  return {message: "Book removed successfully"};
});
