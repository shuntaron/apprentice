function checkPermission(username, permission) {
  let user = users.find(user => user.username === username);
  
  if (user === undefined) {
    console.log(username + ": User not found");
  } else {
    console.log(`checkPermission(${username}, ${permission}): ${user.permissions[permission]}`);
  }
}

let users = [
  {
    username: "山田",
    permissions: {
      canRead: true,
      canWrite: false,
      canDelete: false
    }
  },
  {
    username: "佐藤",
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: "田中",
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: true
    }
  },
];

checkPermission("山田", "canRead")
checkPermission("山田", "canWrite")
checkPermission("山田", "canDelete")
checkPermission("佐藤", "canRead")
checkPermission("佐藤", "canWrite")
checkPermission("佐藤", "canDelete")
checkPermission("田中", "canRead")
checkPermission("田中", "canWrite")
checkPermission("田中", "canDelete")
