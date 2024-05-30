function scramble(str1, str2) {
  
  const set1=[...new Set(str1)];
  const set2=[...new Set(str2)];
  
  let passed=true;
  
  for (let i=0;i<set2.length;i++){
    if(!set1.includes(set2[i])){
      return false;
    }
  };
  
  
  if (passed){
    const arr1=str1.split("").sort();
    const arr1Rev=str1.split("").sort().reverse();
    const arr2=str2.split("").sort();
    const arr2Rev=str2.split("").sort().reverse();

    
    
    
    const arr1Len=arr1.length;
    const arr2Len=arr2.length;
    
    for(let i=0;i<set2.length;i++){
      const currentLetter=set2[i];
      
      
      const currLetterSize1=arr1Rev.indexOf(currentLetter)+arr1.indexOf(currentLetter);
      let res1=arr1Len-currLetterSize1;
      
      const currLetterSize2=arr2Rev.indexOf(currentLetter)+arr2.indexOf(currentLetter);
      let res2=arr2Len-currLetterSize2;
      
      if(res1<res2){
        return false 
      }
    }
    return true;
  }
  else return false;
  
}
