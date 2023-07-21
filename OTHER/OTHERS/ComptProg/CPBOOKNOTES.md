---
annotation-target: ComptProg/newbookc.pdf
---

>%%
>```annotation-json
>{"created":"2023-07-17T00:43:09.100Z","updated":"2023-07-17T00:43:09.100Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":16046,"end":16081},{"type":"TextQuoteSelector","exact":"ios::sync_with_stdio(0);cin.tie(0);","prefix":"input and output more efficient:","suffix":"Note that the newline \"\\n\" works"}]}]}
>```
>%%
>*%%PREFIX%%input and output more efficient:%%HIGHLIGHT%% ==ios::sync_with_stdio(0);cin.tie(0);== %%POSTFIX%%Note that the newline "\n" works*
>%%LINK%%[[#^m4hi13k8boh|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^m4hi13k8boh


>%%
>```annotation-json
>{"created":"2023-07-17T00:43:22.376Z","updated":"2023-07-17T00:43:22.376Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":16081,"end":16176},{"type":"TextQuoteSelector","exact":"Note that the newline \"\\n\" works faster than endl, because endl alwayscauses a flush operation.","prefix":"::sync_with_stdio(0);cin.tie(0);","suffix":"The C functions scanf and printf"}]}]}
>```
>%%
>*%%PREFIX%%::sync_with_stdio(0);cin.tie(0);%%HIGHLIGHT%% ==Note that the newline "\n" works faster than endl, because endl alwayscauses a flush operation.== %%POSTFIX%%The C functions scanf and printf*
>%%LINK%%[[#^24yhvvk176c|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^24yhvvk176c


>%%
>```annotation-json
>{"created":"2023-07-17T00:43:48.095Z","updated":"2023-07-17T00:43:48.095Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":16496,"end":16863},{"type":"TextQuoteSelector","exact":"Sometimes the program should read a whole line from the input, possiblycontaining spaces. This can be accomplished by using the getline function:string s;getline(cin, s);If the amount of data is unknown, the following loop is useful:while (cin >> x) {// code}This loop reads elements from the input one after another, until there is no moredata available in the input","prefix":"b = 456;printf(\"%d %d\\n\", a, b);","suffix":".5In some contest systems, files"}]}]}
>```
>%%
>*%%PREFIX%%b = 456;printf("%d %d\n", a, b);%%HIGHLIGHT%% ==Sometimes the program should read a whole line from the input, possiblycontaining spaces. This can be accomplished by using the getline function:string s;getline(cin, s);If the amount of data is unknown, the following loop is useful:while (cin >> x) {// code}This loop reads elements from the input one after another, until there is no moredata available in the input== %%POSTFIX%%.5In some contest systems, files*
>%%LINK%%[[#^5o83v7y2sk|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^5o83v7y2sk


>%%
>```annotation-json
>{"created":"2023-07-17T00:45:31.425Z","updated":"2023-07-17T00:45:31.425Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":17062,"end":17130},{"type":"TextQuoteSelector","exact":"freopen(\"input.txt\", \"r\", stdin);freopen(\"output.txt\", \"w\", stdout);","prefix":"es to the beginning of the code:","suffix":"After this, the program reads th"}]}]}
>```
>%%
>*%%PREFIX%%es to the beginning of the code:%%HIGHLIGHT%% ==freopen("input.txt", "r", stdin);freopen("output.txt", "w", stdout);== %%POSTFIX%%After this, the program reads th*
>%%LINK%%[[#^z31o05du2fk|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^z31o05du2fk


>%%
>```annotation-json
>{"created":"2023-07-17T00:49:33.941Z","updated":"2023-07-17T00:49:33.941Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":18248,"end":18531},{"type":"TextQuoteSelector","exact":"Usually contest problems are set so that the type long long is enough. Still,it is good to know that the g++ compiler also provides a 128-bit type __int128_twith a value range of −2127 . . . 2127 −1 or about −1038 . . . 1038. However, this typeis not available in all contest systems","prefix":"he expression to (long long)a*a.","suffix":".Modular arithmeticWe denote by "}]}]}
>```
>%%
>*%%PREFIX%%he expression to (long long)a*a.%%HIGHLIGHT%% ==Usually contest problems are set so that the type long long is enough. Still,it is good to know that the g++ compiler also provides a 128-bit type __int128_twith a value range of −2127 . . . 2127 −1 or about −1038 . . . 1038. However, this typeis not available in all contest systems== %%POSTFIX%%.Modular arithmeticWe denote by*
>%%LINK%%[[#^nd3hojtgaz|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^nd3hojtgaz


>%%
>```annotation-json
>{"created":"2023-07-17T00:51:14.067Z","updated":"2023-07-17T00:51:14.067Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":19909,"end":20118},{"type":"TextQuoteSelector","exact":"The usual floating point types in competitive programming are the 64-bit doubleand, as an extension in the g++ compiler, the 80-bit long double. In most cases,double is enough, but long double is more accurate","prefix":" negative.Floating point numbers","suffix":".The required precision of the a"}]}]}
>```
>%%
>*%%PREFIX%%negative.Floating point numbers%%HIGHLIGHT%% ==The usual floating point types in competitive programming are the 64-bit doubleand, as an extension in the g++ compiler, the 80-bit long double. In most cases,double is enough, but long double is more accurate== %%POSTFIX%%.The required precision of the a*
>%%LINK%%[[#^n6s9qf9v18|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^n6s9qf9v18


>%%
>```annotation-json
>{"created":"2023-07-17T00:52:17.524Z","updated":"2023-07-17T00:52:17.524Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":20971,"end":21437},{"type":"TextQuoteSelector","exact":"rs. A better way to compare floating point numbers is to assume that twonumbers are equal if the difference between them is less than ε, where εis asmall number.In practice, the numbers can be compared as follows (ε=10−9):if (abs(a-b) < 1e-9) {// a and b are equal}Note that while floating point numbers are inaccurate, integers up to a certainlimit can still be represented accurately. For example, using double, it is possibleto accurately represent all integers w","prefix":"are not because of precisionerro","suffix":"hose absolute value is at most 2"}]}]}
>```
>%%
>*%%PREFIX%%are not because of precisionerro%%HIGHLIGHT%% ==rs. A better way to compare floating point numbers is to assume that twonumbers are equal if the difference between them is less than ε, where εis asmall number.In practice, the numbers can be compared as follows (ε=10−9):if (abs(a-b) < 1e-9) {// a and b are equal}Note that while floating point numbers are inaccurate, integers up to a certainlimit can still be represented accurately. For example, using double, it is possibleto accurately represent all integers w== %%POSTFIX%%hose absolute value is at most 2*
>%%LINK%%[[#^ozfpveevq3r|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^ozfpveevq3r


>%%
>```annotation-json
>{"created":"2023-07-17T00:55:33.923Z","updated":"2023-07-17T00:55:33.923Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":22288,"end":22294},{"type":"TextQuoteSelector","exact":"Macros","prefix":"t> vi;typedef pair<int,int> pi;8","suffix":"Another way to shorten code is t"}]}]}
>```
>%%
>*%%PREFIX%%t> vi;typedef pair<int,int> pi;8%%HIGHLIGHT%% ==Macros== %%POSTFIX%%Another way to shorten code is t*
>%%LINK%%[[#^tpc8u8j0fuc|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^tpc8u8j0fuc


>%%
>```annotation-json
>{"created":"2023-07-17T14:29:31.503Z","updated":"2023-07-17T14:29:31.503Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":37883,"end":38077},{"type":"TextQuoteSelector","exact":"The time complexity of a recursive function depends on the number of timesthe function is called and the time complexity of a single call. The total timecomplexity is the product of these values","prefix":"j <= m; j++) {// code}}Recursion","suffix":".For example, consider the follo"}]}]}
>```
>%%
>*%%PREFIX%%j <= m; j++) {// code}}Recursion%%HIGHLIGHT%% ==The time complexity of a recursive function depends on the number of timesthe function is called and the time complexity of a single call. The total timecomplexity is the product of these values== %%POSTFIX%%.For example, consider the follo*
>%%LINK%%[[#^0tulmic1bbj|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^0tulmic1bbj


>%%
>```annotation-json
>{"created":"2023-07-17T14:29:36.691Z","updated":"2023-07-17T14:29:36.691Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":38165,"end":38288},{"type":"TextQuoteSelector","exact":"The call f(n) causes n function calls, and the time complexity of each call is O(1).Thus, the total time complexity is O(n)","prefix":" n) {if (n == 1) return;f(n-1);}","suffix":".As another example, consider th"}]}]}
>```
>%%
>*%%PREFIX%%n) {if (n == 1) return;f(n-1);}%%HIGHLIGHT%% ==The call f(n) causes n function calls, and the time complexity of each call is O(1).Thus, the total time complexity is O(n)== %%POSTFIX%%.As another example, consider th*
>%%LINK%%[[#^39tr42earko|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^39tr42earko


>%%
>```annotation-json
>{"created":"2023-07-17T20:49:54.933Z","updated":"2023-07-17T20:49:54.933Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":45314,"end":45582},{"type":"TextQuoteSelector","exact":"In the latter case, since we want to find a subarray with maximum sum, thesubarray that ends at position k −1 should also have the maximum sum. Thus,we can solve the problem efficiently by calculating the maximum subarray sumfor each ending position from left to right","prefix":"wed bythe element at position k.","suffix":".The following code implements t"}]}]}
>```
>%%
>*%%PREFIX%%wed bythe element at position k.%%HIGHLIGHT%% ==In the latter case, since we want to find a subarray with maximum sum, thesubarray that ends at position k −1 should also have the maximum sum. Thus,we can solve the problem efficiently by calculating the maximum subarray sumfor each ending position from left to right== %%POSTFIX%%.The following code implements t*
>%%LINK%%[[#^5cflbqlg7qy|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^5cflbqlg7qy


>%%
>```annotation-json
>{"created":"2023-07-17T20:50:04.510Z","updated":"2023-07-17T20:50:04.510Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":45627,"end":45753},{"type":"TextQuoteSelector","exact":"int best = 0, sum = 0;for (int k = 0; k < n; k++) {sum = max(array[k],sum+array[k]);best = max(best,sum);}cout << best << \"\\n\"","prefix":"g code implements the algorithm:","suffix":";The algorithm only contains one"}]}]}
>```
>%%
>*%%PREFIX%%g code implements the algorithm:%%HIGHLIGHT%% ==int best = 0, sum = 0;for (int k = 0; k < n; k++) {sum = max(array[k],sum+array[k]);best = max(best,sum);}cout << best << "\n"== %%POSTFIX%%;The algorithm only contains one*
>%%LINK%%[[#^tpanzx0oee|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^tpanzx0oee


>%%
>```annotation-json
>{"created":"2023-07-17T20:59:14.145Z","updated":"2023-07-17T20:59:14.145Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":52459,"end":52755},{"type":"TextQuoteSelector","exact":"Counting sortThe lower bound n log n does not apply to algorithms that do not compare arrayelements but use some other information. An example of such an algorithm iscounting sort that sorts an array in O(n) time assuming that every element inthe array is an integer between 0 . . . c and c =O(n)","prefix":" worst case is at least n log n.","suffix":".The algorithm creates a bookkee"}]}]}
>```
>%%
>*%%PREFIX%%worst case is at least n log n.%%HIGHLIGHT%% ==Counting sortThe lower bound n log n does not apply to algorithms that do not compare arrayelements but use some other information. An example of such an algorithm iscounting sort that sorts an array in O(n) time assuming that every element inthe array is an integer between 0 . . . c and c =O(n)== %%POSTFIX%%.The algorithm creates a bookkee*
>%%LINK%%[[#^11ghjje1a0pf|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^11ghjje1a0pf


>%%
>```annotation-json
>{"created":"2023-07-17T20:59:30.515Z","updated":"2023-07-17T20:59:30.515Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":52756,"end":52960},{"type":"TextQuoteSelector","exact":"The algorithm creates a bookkeeping array, whose indices are elements of theoriginal array. The algorithm iterates through the original array and calculateshow many times each element appears in the array","prefix":"r between 0 . . . c and c =O(n).","suffix":".28For example, the array1 3 6 9"}]}]}
>```
>%%
>*%%PREFIX%%r between 0 . . . c and c =O(n).%%HIGHLIGHT%% ==The algorithm creates a bookkeeping array, whose indices are elements of theoriginal array. The algorithm iterates through the original array and calculateshow many times each element appears in the array== %%POSTFIX%%.28For example, the array1 3 6 9*
>%%LINK%%[[#^4qz4pmxze2u|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^4qz4pmxze2u


>%%
>```annotation-json
>{"created":"2023-07-17T21:01:45.653Z","updated":"2023-07-17T21:01:45.653Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":53661,"end":53815},{"type":"TextQuoteSelector","exact":"It is almost never a good idea to use a home-made sorting algorithm in a contest,because there are good implementations available in programming languages","prefix":"bookkeeping array.Sorting in C++","suffix":".For example, the C++ standard l"}]}]}
>```
>%%
>*%%PREFIX%%bookkeeping array.Sorting in C++%%HIGHLIGHT%% ==It is almost never a good idea to use a home-made sorting algorithm in a contest,because there are good implementations available in programming languages== %%POSTFIX%%.For example, the C++ standard l*
>%%LINK%%[[#^y9zr4nw233e|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^y9zr4nw233e


>%%
>```annotation-json
>{"created":"2023-07-17T21:03:35.792Z","updated":"2023-07-17T21:03:35.792Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":56211,"end":56307},{"type":"TextQuoteSelector","exact":"The operator should return trueif the element is smaller than the parameter, and false otherwise","prefix":"other element of the same type. ","suffix":".For example, the following stru"}]}]}
>```
>%%
>*%%PREFIX%%other element of the same type.%%HIGHLIGHT%% ==The operator should return trueif the element is smaller than the parameter, and false otherwise== %%POSTFIX%%.For example, the following stru*
>%%LINK%%[[#^0lrls8t34xkn|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^0lrls8t34xkn


>%%
>```annotation-json
>{"created":"2023-07-17T21:03:42.051Z","updated":"2023-07-17T21:03:42.051Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":54879,"end":54899},{"type":"TextQuoteSelector","exact":"Comparison operators","prefix":"tring ”monkey” becomes ”ekmnoy”.","suffix":"The function sort requires that "}]}]}
>```
>%%
>*%%PREFIX%%tring ”monkey” becomes ”ekmnoy”.%%HIGHLIGHT%% ==Comparison operators== %%POSTFIX%%The function sort requires that*
>%%LINK%%[[#^3k8r8rfi07q|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^3k8r8rfi07q


>%%
>```annotation-json
>{"created":"2023-07-17T21:04:59.111Z","updated":"2023-07-17T21:04:59.111Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":56781,"end":56904},{"type":"TextQuoteSelector","exact":"Comparison functionsIt is also possible to give an external comparison function to the sort functionas a callback function.","prefix":" x < p.x;else return y < p.y;}};","suffix":" For example, the following comp"}]}]}
>```
>%%
>*%%PREFIX%%x < p.x;else return y < p.y;}};%%HIGHLIGHT%% ==Comparison functionsIt is also possible to give an external comparison function to the sort functionas a callback function.== %%POSTFIX%%For example, the following comp*
>%%LINK%%[[#^osxcy9i96oa|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^osxcy9i96oa


>%%
>```annotation-json
>{"created":"2023-07-17T21:09:16.692Z","updated":"2023-07-17T21:09:16.692Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":59899,"end":60243},{"type":"TextQuoteSelector","exact":"C++ functionsThe C++ standard library contains the following functions that are based onbinary search and work in logarithmic time:• lower_bound returns a pointer to the first array element whose value is atleast x.• upper_bound returns a pointer to the first array element whose value islarger than x.• equal_range returns both above pointers.","prefix":"st twice for each jump length.32","suffix":"The functions assume that the ar"}]}]}
>```
>%%
>*%%PREFIX%%st twice for each jump length.32%%HIGHLIGHT%% ==C++ functionsThe C++ standard library contains the following functions that are based onbinary search and work in logarithmic time:• lower_bound returns a pointer to the first array element whose value is atleast x.• upper_bound returns a pointer to the first array element whose value islarger than x.• equal_range returns both above pointers.== %%POSTFIX%%The functions assume that the ar*
>%%LINK%%[[#^jxzoc4b9u09|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^jxzoc4b9u09


>%%
>```annotation-json
>{"created":"2023-07-17T21:16:13.734Z","updated":"2023-07-17T21:16:13.734Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":61933,"end":62116},{"type":"TextQuoteSelector","exact":"Finding the maximum valueBinary search can also be used to find the maximum value for a function that isfirst increasing and then decreasing. Our task is to find a position k such tha","prefix":"l time complexity is O(n log z).","suffix":"t• f (x) <f (x +1) when x <k, an"}]}]}
>```
>%%
>*%%PREFIX%%l time complexity is O(n log z).%%HIGHLIGHT%% ==Finding the maximum valueBinary search can also be used to find the maximum value for a function that isfirst increasing and then decreasing. Our task is to find a position k such tha== %%POSTFIX%%t• f (x) <f (x +1) when x <k, an*
>%%LINK%%[[#^so4yhwpvq3n|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^so4yhwpvq3n


>%%
>```annotation-json
>{"created":"2023-07-17T21:18:24.556Z","updated":"2023-07-17T21:18:24.556Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":63992,"end":64085},{"type":"TextQuoteSelector","exact":"A shorter way to iterate through a vector is as follows:for (auto x : v) {cout << x << \"\\n\";}","prefix":"; i++) {cout << v[i] << \"\\n\";}35","suffix":"The function back returns the la"}]}]}
>```
>%%
>*%%PREFIX%%; i++) {cout << v[i] << "\n";}35%%HIGHLIGHT%% ==A shorter way to iterate through a vector is as follows:for (auto x : v) {cout << x << "\n";}== %%POSTFIX%%The function back returns the la*
>%%LINK%%[[#^gib1r6zo7v|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^gib1r6zo7v


>%%
>```annotation-json
>{"created":"2023-07-17T21:18:30.077Z","updated":"2023-07-17T21:18:30.077Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":64085,"end":64191},{"type":"TextQuoteSelector","exact":"The function back returns the last element in the vector, and the functionpop_back removes the last elemen","prefix":"auto x : v) {cout << x << \"\\n\";}","suffix":"t:vector<int> v;v.push_back(5);v"}]}]}
>```
>%%
>*%%PREFIX%%auto x : v) {cout << x << "\n";}%%HIGHLIGHT%% ==The function back returns the last element in the vector, and the functionpop_back removes the last elemen== %%POSTFIX%%t:vector<int> v;v.push_back(5);v*
>%%LINK%%[[#^pn18fkanj9a|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^pn18fkanj9a


>%%
>```annotation-json
>{"created":"2023-07-17T21:18:47.181Z","updated":"2023-07-17T21:18:47.181Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":64393,"end":64589},{"type":"TextQuoteSelector","exact":"Another way to create a vector is to give the number of elements and theinitial value for each element:// size 10, initial value 0vector<int> v(10);// size 10, initial value 5vector<int> v(10, 5);","prefix":"nts:vector<int> v = {2,4,2,5,1};","suffix":"The internal implementation of a"}]}]}
>```
>%%
>*%%PREFIX%%nts:vector<int> v = {2,4,2,5,1};%%HIGHLIGHT%% ==Another way to create a vector is to give the number of elements and theinitial value for each element:// size 10, initial value 0vector<int> v(10);// size 10, initial value 5vector<int> v(10, 5);== %%POSTFIX%%The internal implementation of a*
>%%LINK%%[[#^kpdnsz4n6l|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^kpdnsz4n6l


>%%
>```annotation-json
>{"created":"2023-07-17T21:19:37.225Z","updated":"2023-07-17T21:19:37.225Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":65104,"end":65279},{"type":"TextQuoteSelector","exact":" The functionsubstr(k, x) returns the substring that begins at position k and has length x, andthe function find(t) finds the position of the first occurrence of a substring t","prefix":" be combined using the + symbol.","suffix":".The following code presents som"}]}]}
>```
>%%
>*%%PREFIX%%be combined using the + symbol.%%HIGHLIGHT%% ==The functionsubstr(k, x) returns the substring that begins at position k and has length x, andthe function find(t) finds the position of the first occurrence of a substring t== %%POSTFIX%%.The following code presents som*
>%%LINK%%[[#^umn4czoc3wm|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^umn4czoc3wm


>%%
>```annotation-json
>{"created":"2023-07-17T21:21:30.878Z","updated":"2023-07-17T21:21:30.878Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":66244,"end":66424},{"type":"TextQuoteSelector","exact":" The function insert adds an element to the set, the function countreturns the number of occurrences of an element in the set, and the functionerase removes an element from the set","prefix":"and shows some of theoperations.","suffix":".set<int> s;s.insert(3);s.insert"}]}]}
>```
>%%
>*%%PREFIX%%and shows some of theoperations.%%HIGHLIGHT%% ==The function insert adds an element to the set, the function countreturns the number of occurrences of an element in the set, and the functionerase removes an element from the set== %%POSTFIX%%.set<int> s;s.insert(3);s.insert*
>%%LINK%%[[#^0qdj7syfyvln|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^0qdj7syfyvln


>%%
>```annotation-json
>{"created":"2023-07-17T21:22:00.899Z","updated":"2023-07-17T21:22:00.899Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":66934,"end":67197},{"type":"TextQuoteSelector","exact":"An important property of sets is that all their elements are distinct. Thus,the function count always returns either 0 (the element is not in the set) or 1 (theelement is in the set), and the function insert never adds an element to the set ifit is already there.","prefix":"auto x : s) {cout << x << \"\\n\";}","suffix":" The following code illustrates "}]}]}
>```
>%%
>*%%PREFIX%%auto x : s) {cout << x << "\n";}%%HIGHLIGHT%% ==An important property of sets is that all their elements are distinct. Thus,the function count always returns either 0 (the element is not in the set) or 1 (theelement is in the set), and the function insert never adds an element to the set ifit is already there.== %%POSTFIX%%The following code illustrates*
>%%LINK%%[[#^vezz0ldthr|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^vezz0ldthr


>%%
>```annotation-json
>{"created":"2023-07-17T21:22:08.678Z","updated":"2023-07-17T21:22:08.678Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":66623,"end":66843},{"type":"TextQuoteSelector","exact":"A set can be used mostly like a vector, but it is not possible to access theelements using the [] notation. The following code creates a set, prints thenumber of elements in it, and then iterates through all the elements","prefix":"cout << s.count(4) << \"\\n\"; // 1","suffix":":set<int> s = {2,5,6,8};cout << "}]}]}
>```
>%%
>*%%PREFIX%%cout << s.count(4) << "\n"; // 1%%HIGHLIGHT%% ==A set can be used mostly like a vector, but it is not possible to access theelements using the [] notation. The following code creates a set, prints thenumber of elements in it, and then iterates through all the elements== %%POSTFIX%%:set<int> s = {2,5,6,8};cout <<*
>%%LINK%%[[#^r1l653mfllm|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^r1l653mfllm


>%%
>```annotation-json
>{"created":"2023-07-17T21:22:47.811Z","updated":"2023-07-17T21:22:47.811Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":67315,"end":67481},{"type":"TextQuoteSelector","exact":"C++ also contains the structures multiset and unordered_multiset that other-wise work like set and unordered_set but they can contain multiple instances ofan element.","prefix":"ut << s.count(5) << \"\\n\"; // 137","suffix":" For example, in the following c"}]}]}
>```
>%%
>*%%PREFIX%%ut << s.count(5) << "\n"; // 137%%HIGHLIGHT%% ==C++ also contains the structures multiset and unordered_multiset that other-wise work like set and unordered_set but they can contain multiple instances ofan element.== %%POSTFIX%%For example, in the following c*
>%%LINK%%[[#^idnch1niaa|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^idnch1niaa


>%%
>```annotation-json
>{"created":"2023-07-17T21:22:54.206Z","updated":"2023-07-17T21:22:54.206Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":67673,"end":67730},{"type":"TextQuoteSelector","exact":"erase removes all instances of an element from a multiset","prefix":"nt(5) << \"\\n\"; // 3The function ","suffix":":s.erase(5);cout << s.count(5) <"}]}]}
>```
>%%
>*%%PREFIX%%nt(5) << "\n"; // 3The function%%HIGHLIGHT%% ==erase removes all instances of an element from a multiset== %%POSTFIX%%:s.erase(5);cout << s.count(5) <*
>%%LINK%%[[#^wfbgtx5z9rc|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^wfbgtx5z9rc


>%%
>```annotation-json
>{"created":"2023-07-17T21:23:05.429Z","updated":"2023-07-17T21:23:05.429Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":67781,"end":67898},{"type":"TextQuoteSelector","exact":"only one instance should be removed, which can be done as follows:s.erase(s.find(5));cout << s.count(5) << \"\\n\"; // 2","prefix":" s.count(5) << \"\\n\"; // 0Often, ","suffix":"Map structuresA map is a general"}]}]}
>```
>%%
>*%%PREFIX%%s.count(5) << "\n"; // 0Often,%%HIGHLIGHT%% ==only one instance should be removed, which can be done as follows:s.erase(s.find(5));cout << s.count(5) << "\n"; // 2== %%POSTFIX%%Map structuresA map is a general*
>%%LINK%%[[#^4wvw0ilwjbi|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^4wvw0ilwjbi


>%%
>```annotation-json
>{"created":"2023-07-17T21:25:25.873Z","updated":"2023-07-17T21:25:25.873Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":67912,"end":67974},{"type":"TextQuoteSelector","exact":"A map is a generalized array that consists of key-value-pairs.","prefix":"t(5) << \"\\n\"; // 2Map structures","suffix":" While the keys inan ordinary ar"}]}]}
>```
>%%
>*%%PREFIX%%t(5) << "\n"; // 2Map structures%%HIGHLIGHT%% ==A map is a generalized array that consists of key-value-pairs.== %%POSTFIX%%While the keys inan ordinary ar*
>%%LINK%%[[#^sy6z7mnec1d|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^sy6z7mnec1d


>%%
>```annotation-json
>{"created":"2023-07-17T21:25:48.924Z","updated":"2023-07-17T21:25:48.924Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":68286,"end":68478},{"type":"TextQuoteSelector","exact":" the structure map is based on a balanced binary treeand accessing elements takes O(log n) time, while the structure unordered_mapuses hashing and accessing elements takes O(1) time on average","prefix":"spondto the set implementations:","suffix":".The following code creates a ma"}]}]}
>```
>%%
>*%%PREFIX%%spondto the set implementations:%%HIGHLIGHT%% ==the structure map is based on a balanced binary treeand accessing elements takes O(log n) time, while the structure unordered_mapuses hashing and accessing elements takes O(1) time on average== %%POSTFIX%%.The following code creates a ma*
>%%LINK%%[[#^floixdah7la|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^floixdah7la


>%%
>```annotation-json
>{"created":"2023-07-17T21:26:13.821Z","updated":"2023-07-17T21:26:13.821Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":68670,"end":68800},{"type":"TextQuoteSelector","exact":"If the value of a key is requested but the map does not contain it, the keyis automatically added to the map with a default value.","prefix":"out << m[\"banana\"] << \"\\n\"; // 3","suffix":" For example, in thefollowing co"}]}]}
>```
>%%
>*%%PREFIX%%out << m["banana"] << "\n"; // 3%%HIGHLIGHT%% ==If the value of a key is requested but the map does not contain it, the keyis automatically added to the map with a default value.== %%POSTFIX%%For example, in thefollowing co*
>%%LINK%%[[#^7byorea27if|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^7byorea27if


>%%
>```annotation-json
>{"created":"2023-07-17T21:26:26.165Z","updated":"2023-07-17T21:26:26.165Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":68566,"end":68669},{"type":"TextQuoteSelector","exact":"map<string,int> m;m[\"monkey\"] = 4;m[\"banana\"] = 3;m[\"harpsichord\"] = 9;cout << m[\"banana\"] << \"\\n\"; // ","prefix":"ings and the valuesare integers:","suffix":"3If the value of a key is reques"}]}]}
>```
>%%
>*%%PREFIX%%ings and the valuesare integers:%%HIGHLIGHT%% ==map<string,int> m;m["monkey"] = 4;m["banana"] = 3;m["harpsichord"] = 9;cout << m["banana"] << "\n"; //== %%POSTFIX%%3If the value of a key is reques*
>%%LINK%%[[#^27qqtucks2b|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^27qqtucks2b


>%%
>```annotation-json
>{"created":"2023-07-17T21:26:46.336Z","updated":"2023-07-17T21:26:46.336Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":68941,"end":69152},{"type":"TextQuoteSelector","exact":"The function count checks if a key exists in a map:if (m.count(\"aybabtu\")) {// key exists}The following code prints all the keys and values in a map:for (auto x : m) {cout << x.first << \" \" << x.second << \"\\n\";}","prefix":" << m[\"aybabtu\"] << \"\\n\"; // 038","suffix":"Iterators and rangesMany functio"}]}]}
>```
>%%
>*%%PREFIX%%<< m["aybabtu"] << "\n"; // 038%%HIGHLIGHT%% ==The function count checks if a key exists in a map:if (m.count("aybabtu")) {// key exists}The following code prints all the keys and values in a map:for (auto x : m) {cout << x.first << " " << x.second << "\n";}== %%POSTFIX%%Iterators and rangesMany functio*
>%%LINK%%[[#^hlukdc5299n|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^hlukdc5299n


>%%
>```annotation-json
>{"created":"2023-07-17T21:43:56.386Z","updated":"2023-07-17T21:43:56.386Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":69630,"end":69821},{"type":"TextQuoteSelector","exact":"Note the asymmetry in the iterators: s.begin() points to an element in thedata structure, while s.end() points outside the data structure. Thus, the rangedefined by the iterators is half-open","prefix":"13, 14, 17 }↑ ↑s.begin() s.end()","suffix":".Working with rangesIterators ar"}]}]}
>```
>%%
>*%%PREFIX%%13, 14, 17 }↑ ↑s.begin() s.end()%%HIGHLIGHT%% ==Note the asymmetry in the iterators: s.begin() points to an element in thedata structure, while s.end() points outside the data structure. Thus, the rangedefined by the iterators is half-open== %%POSTFIX%%.Working with rangesIterators ar*
>%%LINK%%[[#^5tz5hbm5e0u|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^5tz5hbm5e0u


>%%
>```annotation-json
>{"created":"2023-07-17T21:44:00.932Z","updated":"2023-07-17T21:44:00.932Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":69152,"end":69172},{"type":"TextQuoteSelector","exact":"Iterators and ranges","prefix":"rst << \" \" << x.second << \"\\n\";}","suffix":"Many functions in the C++ standa"}]}]}
>```
>%%
>*%%PREFIX%%rst << " " << x.second << "\n";}%%HIGHLIGHT%% ==Iterators and ranges== %%POSTFIX%%Many functions in the C++ standa*
>%%LINK%%[[#^48yqlexkvfe|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^48yqlexkvfe


>%%
>```annotation-json
>{"created":"2023-07-17T21:45:40.774Z","updated":"2023-07-17T21:45:40.774Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":70068,"end":70375},{"type":"TextQuoteSelector","exact":"For example, the following code sorts a vector using the function sort, thenreverses the order of the elements using the function reverse, and finally shufflesthe order of the elements using the function random_shuffle.sort(v.begin(), v.end());reverse(v.begin(), v.end());random_shuffle(v.begin(), v.end());","prefix":" end are given for the function.","suffix":"These functions can also be used"}]}]}
>```
>%%
>*%%PREFIX%%end are given for the function.%%HIGHLIGHT%% ==For example, the following code sorts a vector using the function sort, thenreverses the order of the elements using the function reverse, and finally shufflesthe order of the elements using the function random_shuffle.sort(v.begin(), v.end());reverse(v.begin(), v.end());random_shuffle(v.begin(), v.end());== %%POSTFIX%%These functions can also be used*
>%%LINK%%[[#^p312ad7i7qa|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^p312ad7i7qa


>%%
>```annotation-json
>{"created":"2023-07-17T21:46:36.514Z","updated":"2023-07-17T21:46:36.514Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":70719,"end":70819},{"type":"TextQuoteSelector","exact":"set<int>::iterator it = s.begin();A shorter way to write the code is as follows:auto it = s.begin();","prefix":"o the smallest element in a set:","suffix":"The element to which an iterator"}]}]}
>```
>%%
>*%%PREFIX%%o the smallest element in a set:%%HIGHLIGHT%% ==set<int>::iterator it = s.begin();A shorter way to write the code is as follows:auto it = s.begin();== %%POSTFIX%%The element to which an iterator*
>%%LINK%%[[#^rd1i5ei67e|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^rd1i5ei67e


>%%
>```annotation-json
>{"created":"2023-07-17T21:51:46.351Z","updated":"2023-07-17T21:51:46.351Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":71002,"end":71150},{"type":"TextQuoteSelector","exact":"Iterators can be moved using the operators ++ (forward) and -- (backward),meaning that the iterator moves to the next or previous element in the set","prefix":"= s.begin();cout << *it << \"\\n\";","suffix":".The following code prints all t"}]}]}
>```
>%%
>*%%PREFIX%%= s.begin();cout << *it << "\n";%%HIGHLIGHT%% ==Iterators can be moved using the operators ++ (forward) and -- (backward),meaning that the iterator moves to the next or previous element in the set== %%POSTFIX%%.The following code prints all t*
>%%LINK%%[[#^y4m2lm6jg9d|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^y4m2lm6jg9d


>%%
>```annotation-json
>{"created":"2023-07-17T21:53:32.383Z","updated":"2023-07-17T21:53:32.383Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":71283,"end":71384},{"type":"TextQuoteSelector","exact":"The following code prints the largest element in the set:auto it = s.end(); it--;cout << *it << \"\\n\";","prefix":"(); it++) {cout << *it << \"\\n\";}","suffix":"The function find(x) returns an "}]}]}
>```
>%%
>*%%PREFIX%%(); it++) {cout << *it << "\n";}%%HIGHLIGHT%% ==The following code prints the largest element in the set:auto it = s.end(); it--;cout << *it << "\n";== %%POSTFIX%%The function find(x) returns an*
>%%LINK%%[[#^ujhgqazzxrp|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^ujhgqazzxrp


>%%
>```annotation-json
>{"created":"2023-07-17T21:57:29.400Z","updated":"2023-07-17T21:57:29.400Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":72009,"end":72288},{"type":"TextQuoteSelector","exact":"For example, the following code finds the element nearest to x:auto it = s.lower_bound(x);if (it == s.begin()) {cout << *it << \"\\n\";} else if (it == s.end()) {it--;cout << *it << \"\\n\";} else {int a = *it; it--;int b = *it;if (x-b < a-x) cout << b << \"\\n\";else cout << a << \"\\n\";}","prefix":"tain the orderof the elements.40","suffix":"The code assumes that the set is"}]}]}
>```
>%%
>*%%PREFIX%%tain the orderof the elements.40%%HIGHLIGHT%% ==For example, the following code finds the element nearest to x:auto it = s.lower_bound(x);if (it == s.begin()) {cout << *it << "\n";} else if (it == s.end()) {it--;cout << *it << "\n";} else {int a = *it; it--;int b = *it;if (x-b < a-x) cout << b << "\n";else cout << a << "\n";}== %%POSTFIX%%The code assumes that the set is*
>%%LINK%%[[#^epe4vpbz2b5|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^epe4vpbz2b5


>%%
>```annotation-json
>{"created":"2023-07-17T22:01:09.369Z","updated":"2023-07-17T22:01:09.369Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":73584,"end":73710},{"type":"TextQuoteSelector","exact":"The function count returns the number of ones in the bitset:bitset<10> s(string(\"0010011010\"));cout << s.count() << \"\\n\"; // 4","prefix":"// 1cout << s[5] << \"\\n\"; // 041","suffix":"The following code shows example"}]}]}
>```
>%%
>*%%PREFIX%%// 1cout << s[5] << "\n"; // 041%%HIGHLIGHT%% ==The function count returns the number of ones in the bitset:bitset<10> s(string("0010011010"));cout << s.count() << "\n"; // 4== %%POSTFIX%%The following code shows example*
>%%LINK%%[[#^ukmk3keril|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^ukmk3keril


>%%
>```annotation-json
>{"created":"2023-07-17T22:01:19.241Z","updated":"2023-07-17T22:01:19.241Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":72738,"end":72873},{"type":"TextQuoteSelector","exact":"BitsetA bitset is an array whose each value is either 0 or 1. For example, the followingcode creates a bitset that contains 10 elements","prefix":"revious element.Other structures","suffix":":bitset<10> s;s[1] = 1;s[3] = 1;"}]}]}
>```
>%%
>*%%PREFIX%%revious element.Other structures%%HIGHLIGHT%% ==BitsetA bitset is an array whose each value is either 0 or 1. For example, the followingcode creates a bitset that contains 10 elements== %%POSTFIX%%:bitset<10> s;s[1] = 1;s[3] = 1;*
>%%LINK%%[[#^3xxnt120ib8|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^3xxnt120ib8


>%%
>```annotation-json
>{"created":"2023-07-17T22:01:32.276Z","updated":"2023-07-17T22:01:32.276Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":73473,"end":73582},{"type":"TextQuoteSelector","exact":"bitset<10> s(string(\"0010011010\")); // from right to leftcout << s[4] << \"\\n\"; // 1cout << s[5] << \"\\n\"; // 0","prefix":" way to create the above bitset:","suffix":"41The function count returns the"}]}]}
>```
>%%
>*%%PREFIX%%way to create the above bitset:%%HIGHLIGHT%% ==bitset<10> s(string("0010011010")); // from right to leftcout << s[4] << "\n"; // 1cout << s[5] << "\n"; // 0== %%POSTFIX%%41The function count returns the*
>%%LINK%%[[#^2ggr2t31igt|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^2ggr2t31igt


>%%
>```annotation-json
>{"created":"2023-07-17T22:01:54.211Z","updated":"2023-07-17T22:01:54.211Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":73946,"end":74041},{"type":"TextQuoteSelector","exact":"DequeA deque is a dynamic array whose size can be efficiently changed at both ends ofthe array.","prefix":" << (a^b) << \"\\n\"; // 1001101110","suffix":" Like a vector, a deque provides"}]}]}
>```
>%%
>*%%PREFIX%%<< (a^b) << "\n"; // 1001101110%%HIGHLIGHT%% ==DequeA deque is a dynamic array whose size can be efficiently changed at both ends ofthe array.== %%POSTFIX%%Like a vector, a deque provides*
>%%LINK%%[[#^e9ynk09i89k|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^e9ynk09i89k


>%%
>```annotation-json
>{"created":"2023-07-17T22:02:06.773Z","updated":"2023-07-17T22:02:06.773Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":74111,"end":74170},{"type":"TextQuoteSelector","exact":"but it also includes the functions push_front and pop_front","prefix":"unctions push_back and pop_back,","suffix":" which are not avail-able in a v"}]}]}
>```
>%%
>*%%PREFIX%%unctions push_back and pop_back,%%HIGHLIGHT%% ==but it also includes the functions push_front and pop_front== %%POSTFIX%%which are not avail-able in a v*
>%%LINK%%[[#^8y1hzv9afl3|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^8y1hzv9afl3


>%%
>```annotation-json
>{"created":"2023-07-17T22:02:49.163Z","updated":"2023-07-17T22:02:49.163Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":74578,"end":74773},{"type":"TextQuoteSelector","exact":"StackA stack is a data structure that provides two O(1) time operations: adding anelement to the top, and removing an element from the top. It is only possible toaccess the top element of a stack","prefix":"1) time on average at both ends.","suffix":".The following code shows how a "}]}]}
>```
>%%
>*%%PREFIX%%1) time on average at both ends.%%HIGHLIGHT%% ==StackA stack is a data structure that provides two O(1) time operations: adding anelement to the top, and removing an element from the top. It is only possible toaccess the top element of a stack== %%POSTFIX%%.The following code shows how a*
>%%LINK%%[[#^b1k5qo3uwu|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^b1k5qo3uwu


>%%
>```annotation-json
>{"created":"2023-07-17T22:03:09.613Z","updated":"2023-07-17T22:03:09.613Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":74823,"end":74916},{"type":"TextQuoteSelector","exact":"stack<int> s;s.push(3);s.push(2);s.push(5);cout << s.top(); // 5s.pop();cout << s.top(); // 2","prefix":"e shows how a stack can be used:","suffix":"42QueueA queue also provides two"}]}]}
>```
>%%
>*%%PREFIX%%e shows how a stack can be used:%%HIGHLIGHT%% ==stack<int> s;s.push(3);s.push(2);s.push(5);cout << s.top(); // 5s.pop();cout << s.top(); // 2== %%POSTFIX%%42QueueA queue also provides two*
>%%LINK%%[[#^afmk3yziz3f|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^afmk3yziz3f


>%%
>```annotation-json
>{"created":"2023-07-17T22:03:32.243Z","updated":"2023-07-17T22:03:32.243Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":74918,"end":75271},{"type":"TextQuoteSelector","exact":"QueueA queue also provides two O(1) time operations: adding an element to the endof the queue, and removing the first element in the queue. It is only possible toaccess the first and last element of a queue.The following code shows how a queue can be used:queue<int> q;q.push(3);q.push(2);q.push(5);cout << q.front(); // 3q.pop();cout << q.front(); // 2","prefix":"5s.pop();cout << s.top(); // 242","suffix":"Priority queueA priority queue m"}]}]}
>```
>%%
>*%%PREFIX%%5s.pop();cout << s.top(); // 242%%HIGHLIGHT%% ==QueueA queue also provides two O(1) time operations: adding an element to the endof the queue, and removing the first element in the queue. It is only possible toaccess the first and last element of a queue.The following code shows how a queue can be used:queue<int> q;q.push(3);q.push(2);q.push(5);cout << q.front(); // 3q.pop();cout << q.front(); // 2== %%POSTFIX%%Priority queueA priority queue m*
>%%LINK%%[[#^4f1eak4v5a8|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^4f1eak4v5a8


>%%
>```annotation-json
>{"created":"2023-07-17T22:08:14.619Z","updated":"2023-07-17T22:08:14.619Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":76024,"end":76207},{"type":"TextQuoteSelector","exact":"priority_queue<int> q;q.push(3);q.push(5);q.push(7);q.push(2);cout << q.top() << \"\\n\"; // 7q.pop();cout << q.top() << \"\\n\"; // 5q.pop();q.push(6);cout << q.top() << \"\\n\"; // 6q.pop();","prefix":"following code illustrates this:","suffix":"If we want to create a priority "}]}]}
>```
>%%
>*%%PREFIX%%following code illustrates this:%%HIGHLIGHT%% ==priority_queue<int> q;q.push(3);q.push(5);q.push(7);q.push(2);cout << q.top() << "\n"; // 7q.pop();cout << q.top() << "\n"; // 5q.pop();q.push(6);cout << q.top() << "\n"; // 6q.pop();== %%POSTFIX%%If we want to create a priority*
>%%LINK%%[[#^g4df6fkau6l|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^g4df6fkau6l


>%%
>```annotation-json
>{"created":"2023-07-17T22:08:22.363Z","updated":"2023-07-17T22:08:22.363Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":76207,"end":76372},{"type":"TextQuoteSelector","exact":"If we want to create a priority queue that supports finding and removing thesmallest element, we can do it as follows:priority_queue<int,vector<int>,greater<int>> q;","prefix":"<< q.top() << \"\\n\"; // 6q.pop();","suffix":"43Policy-based data structuresTh"}]}]}
>```
>%%
>*%%PREFIX%%<< q.top() << "\n"; // 6q.pop();%%HIGHLIGHT%% ==If we want to create a priority queue that supports finding and removing thesmallest element, we can do it as follows:priority_queue<int,vector<int>,greater<int>> q;== %%POSTFIX%%43Policy-based data structuresTh*
>%%LINK%%[[#^tozeb8s9dlb|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^tozeb8s9dlb


>%%
>```annotation-json
>{"created":"2023-07-17T22:08:31.759Z","updated":"2023-07-17T22:08:31.759Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":75271,"end":75544},{"type":"TextQuoteSelector","exact":"Priority queueA priority queue maintains a set of elements. The supported operations areinsertion and, depending on the type of the queue, retrieval and removal of eitherthe minimum or maximum element. Insertion and removal take O(log n) time,and retrieval takes O(1) time.","prefix":"3q.pop();cout << q.front(); // 2","suffix":"While an ordered set efficiently"}]}]}
>```
>%%
>*%%PREFIX%%3q.pop();cout << q.front(); // 2%%HIGHLIGHT%% ==Priority queueA priority queue maintains a set of elements. The supported operations areinsertion and, depending on the type of the queue, retrieval and removal of eitherthe minimum or maximum element. Insertion and removal take O(log n) time,and retrieval takes O(1) time.== %%POSTFIX%%While an ordered set efficiently*
>%%LINK%%[[#^4ne9l6jo72v|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^4ne9l6jo72v


>%%
>```annotation-json
>{"created":"2023-07-17T22:10:24.302Z","updated":"2023-07-17T22:10:24.302Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":76374,"end":77281},{"type":"TextQuoteSelector","exact":"Policy-based data structuresThe g++ compiler also supports some data structures that are not part of the C++standard library. Such structures are called policy-based data structures. To usethese structures, the following lines must be added to the code:#include <ext/pb_ds/assoc_container.hpp>using namespace __gnu_pbds;After this, we can define a data structure indexed_set that is like set but can beindexed like an array. The definition for int values is as follows:typedef tree<int,null_type,less<int>,rb_tree_tag,tree_order_statistics_node_update> indexed_set;Now we can create a set as follows:indexed_set s;s.insert(2);s.insert(3);s.insert(7);s.insert(9);The speciality of this set is that we have access to the indices that the elementswould have in a sorted array. The function find_by_order returns an iterator tothe element at a given position:auto x = s.find_by_order(2);cout << *x << \"\\n\"; // 7","prefix":"t,vector<int>,greater<int>> q;43","suffix":"And the function order_of_key re"}]}]}
>```
>%%
>*%%PREFIX%%t,vector<int>,greater<int>> q;43%%HIGHLIGHT%% ==Policy-based data structuresThe g++ compiler also supports some data structures that are not part of the C++standard library. Such structures are called policy-based data structures. To usethese structures, the following lines must be added to the code:#include <ext/pb_ds/assoc_container.hpp>using namespace __gnu_pbds;After this, we can define a data structure indexed_set that is like set but can beindexed like an array. The definition for int values is as follows:typedef tree<int,null_type,less<int>,rb_tree_tag,tree_order_statistics_node_update> indexed_set;Now we can create a set as follows:indexed_set s;s.insert(2);s.insert(3);s.insert(7);s.insert(9);The speciality of this set is that we have access to the indices that the elementswould have in a sorted array. The function find_by_order returns an iterator tothe element at a given position:auto x = s.find_by_order(2);cout << *x << "\n"; // 7== %%POSTFIX%%And the function order_of_key re*
>%%LINK%%[[#^u2e0e1qs87i|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^u2e0e1qs87i


>%%
>```annotation-json
>{"created":"2023-07-17T22:13:16.595Z","updated":"2023-07-17T22:13:16.595Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":77849,"end":77939},{"type":"TextQuoteSelector","exact":"Let us consider a problem where we are given two lists A and B that bothcontain n elements","prefix":"dden in their time complexities.","suffix":". Our task is to calculate the n"}]}]}
>```
>%%
>*%%PREFIX%%dden in their time complexities.%%HIGHLIGHT%% ==Let us consider a problem where we are given two lists A and B that bothcontain n elements== %%POSTFIX%%. Our task is to calculate the n*
>%%LINK%%[[#^gldji53qy6g|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^gldji53qy6g


>%%
>```annotation-json
>{"created":"2023-07-17T22:13:28.451Z","updated":"2023-07-17T22:13:28.451Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":77613,"end":77634},{"type":"TextQuoteSelector","exact":"Comparison to sorting","prefix":"ctions work in logarithmic time.","suffix":"It is often possible to solve a "}]}]}
>```
>%%
>*%%PREFIX%%ctions work in logarithmic time.%%HIGHLIGHT%% ==Comparison to sorting== %%POSTFIX%%It is often possible to solve a*
>%%LINK%%[[#^jv3zc0nq8n|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^jv3zc0nq8n


>%%
>```annotation-json
>{"created":"2023-07-17T22:15:17.305Z","updated":"2023-07-17T22:15:17.305Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":79237,"end":80076},{"type":"TextQuoteSelector","exact":"Efficiency comparisonThe following table shows how efficient the above algorithms are when n variesand the elements of the lists are random integers between 1 . . . 109:n Algorithm 1 Algorithm 2 Algorithm 3106 1.5 s 0.3 s 0.2 s2 ·106 3.7 s 0.8 s 0.3 s3 ·106 5.7 s 1.3 s 0.5 s4 ·106 7.7 s 1.7 s 0.7 s5 ·106 10.0 s 2.3 s 0.9 sAlgorithms 1 and 2 are equal except that they use different set structures. Inthis problem, this choice has an important effect on the running time, becauseAlgorithm 2 is 4–5 times faster than Algorithm 1.However, the most efficient algorithm is Algorithm 3 which uses sorting.It only uses half the time compared to Algorithm 2. Interestingly, the timecomplexity of both Algorithm 1 and Algorithm 3 is O(n log n), but despite this,Algorithm 3 is ten times faster. This can be explained by the fact that sorting is a","prefix":"l time complexity is O(n log n).","suffix":"45simple procedure and it is don"}]}]}
>```
>%%
>*%%PREFIX%%l time complexity is O(n log n).%%HIGHLIGHT%% ==Efficiency comparisonThe following table shows how efficient the above algorithms are when n variesand the elements of the lists are random integers between 1 . . . 109:n Algorithm 1 Algorithm 2 Algorithm 3106 1.5 s 0.3 s 0.2 s2 ·106 3.7 s 0.8 s 0.3 s3 ·106 5.7 s 1.3 s 0.5 s4 ·106 7.7 s 1.7 s 0.7 s5 ·106 10.0 s 2.3 s 0.9 sAlgorithms 1 and 2 are equal except that they use different set structures. Inthis problem, this choice has an important effect on the running time, becauseAlgorithm 2 is 4–5 times faster than Algorithm 1.However, the most efficient algorithm is Algorithm 3 which uses sorting.It only uses half the time compared to Algorithm 2. Interestingly, the timecomplexity of both Algorithm 1 and Algorithm 3 is O(n log n), but despite this,Algorithm 3 is ten times faster. This can be explained by the fact that sorting is a== %%POSTFIX%%45simple procedure and it is don*
>%%LINK%%[[#^t1bxtz07mik|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^t1bxtz07mik


>%%
>```annotation-json
>{"created":"2023-07-17T22:41:00.335Z","updated":"2023-07-17T22:41:00.335Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":80313,"end":80328},{"type":"TextQuoteSelector","exact":"Complete search","prefix":" the whole algorithm.46Chapter 5","suffix":"Complete search is a general met"}]}]}
>```
>%%
>*%%PREFIX%%the whole algorithm.46Chapter 5%%HIGHLIGHT%% ==Complete search== %%POSTFIX%%Complete search is a general met*
>%%LINK%%[[#^9bsynmb4k8|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^9bsynmb4k8


>%%
>```annotation-json
>{"created":"2023-07-17T23:03:06.953Z","updated":"2023-07-17T23:03:06.953Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":82314,"end":83253},{"type":"TextQuoteSelector","exact":"Another way to generate subsets is based on the bit representation of integers.Each subset of a set of n elements can be represented as a sequence of n bits,which corresponds to an integer between 0 . . . 2n −1. The ones in the bit sequenceindicate which elements are included in the subset.The usual convention is that the last bit corresponds to element 0, the secondlast bit corresponds to element 1, and so on. For example, the bit representationof 25 is 11001, which corresponds to the subset {0, 3, 4}.The following code goes through the subsets of a set of n elementsfor (int b = 0; b < (1<<n); b++) {// process subset}The following code shows how we can find the elements of a subset thatcorresponds to a bit sequence. When processing each subset, the code builds avector that contains the elements in the subset.for (int b = 0; b < (1<<n); b++) {vector<int> subset;for (int i = 0; i < n; i++) {if (b&(1<<i)) subset.push_back(i);}}","prefix":" {0, 2} {0, 1} {0, 1, 2}Method 2","suffix":"48Generating permutationsNext we"}]}]}
>```
>%%
>*%%PREFIX%%{0, 2} {0, 1} {0, 1, 2}Method 2%%HIGHLIGHT%% ==Another way to generate subsets is based on the bit representation of integers.Each subset of a set of n elements can be represented as a sequence of n bits,which corresponds to an integer between 0 . . . 2n −1. The ones in the bit sequenceindicate which elements are included in the subset.The usual convention is that the last bit corresponds to element 0, the secondlast bit corresponds to element 1, and so on. For example, the bit representationof 25 is 11001, which corresponds to the subset {0, 3, 4}.The following code goes through the subsets of a set of n elementsfor (int b = 0; b < (1<<n); b++) {// process subset}The following code shows how we can find the elements of a subset thatcorresponds to a bit sequence. When processing each subset, the code builds avector that contains the elements in the subset.for (int b = 0; b < (1<<n); b++) {vector<int> subset;for (int i = 0; i < n; i++) {if (b&(1<<i)) subset.push_back(i);}}== %%POSTFIX%%48Generating permutationsNext we*
>%%LINK%%[[#^91tfm72tky8|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^91tfm72tky8


>%%
>```annotation-json
>{"created":"2023-07-17T23:03:19.566Z","updated":"2023-07-17T23:03:19.566Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":80883,"end":81221},{"type":"TextQuoteSelector","exact":"Generating subsetsWe first consider the problem of generating all subsets of a set of n elements. Forexample, the subsets of {0, 1, 2} are ;, {0}, {1}, {2}, {0, 1}, {0, 2}, {1, 2} and {0, 1, 2}.There are two common methods to generate subsets: we can either perform arecursive search or exploit the bit representation of integers.Method 1","prefix":"amic programming, may be needed.","suffix":"An elegant way to go through all"}]}]}
>```
>%%
>*%%PREFIX%%amic programming, may be needed.%%HIGHLIGHT%% ==Generating subsetsWe first consider the problem of generating all subsets of a set of n elements. Forexample, the subsets of {0, 1, 2} are ;, {0}, {1}, {2}, {0, 1}, {0, 2}, {1, 2} and {0, 1, 2}.There are two common methods to generate subsets: we can either perform arecursive search or exploit the bit representation of integers.Method 1== %%POSTFIX%%An elegant way to go through all*
>%%LINK%%[[#^deszlpjrbrk|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^deszlpjrbrk



>%%
>```annotation-json
>{"created":"2023-07-17T23:08:07.685Z","updated":"2023-07-17T23:08:07.685Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":83255,"end":83278},{"type":"TextQuoteSelector","exact":"Generating permutations","prefix":"(1<<i)) subset.push_back(i);}}48","suffix":"Next we consider the problem of "}]}]}
>```
>%%
>*%%PREFIX%%(1<<i)) subset.push_back(i);}}48%%HIGHLIGHT%% ==Generating permutations== %%POSTFIX%%Next we consider the problem of*
>%%LINK%%[[#^68nweydw2kq|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^68nweydw2kq


>%%
>```annotation-json
>{"created":"2023-07-17T23:10:54.943Z","updated":"2023-07-17T23:10:54.943Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":83579,"end":84324},{"type":"TextQuoteSelector","exact":"Method 1Like subsets, permutations can be generated using recursion. The followingfunction search goes through the permutations of the set {0, 1, . . . , n −1}. Thefunction builds a vector permutation that contains the permutation, and thesearch begins when the function is called without parameters.void search() {if (permutation.size() == n) {// process permutation} else {for (int i = 0; i < n; i++) {if (chosen[i]) continue;chosen[i] = true;permutation.push_back(i);search();chosen[i] = false;permutation.pop_back();}}}Each function call adds a new element to permutation. The array chosenindicates which elements are already included in the permutation. If the size ofpermutation equals the size of the set, a permutation has been generated","prefix":"gh the permutations iteratively.","suffix":".Method 2Another method for gene"}]}]}
>```
>%%
>*%%PREFIX%%gh the permutations iteratively.%%HIGHLIGHT%% ==Method 1Like subsets, permutations can be generated using recursion. The followingfunction search goes through the permutations of the set {0, 1, . . . , n −1}. Thefunction builds a vector permutation that contains the permutation, and thesearch begins when the function is called without parameters.void search() {if (permutation.size() == n) {// process permutation} else {for (int i = 0; i < n; i++) {if (chosen[i]) continue;chosen[i] = true;permutation.push_back(i);search();chosen[i] = false;permutation.pop_back();}}}Each function call adds a new element to permutation. The array chosenindicates which elements are already included in the permutation. If the size ofpermutation equals the size of the set, a permutation has been generated== %%POSTFIX%%.Method 2Another method for gene*
>%%LINK%%[[#^2ftl8ol25xj|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^2ftl8ol25xj


>%%
>```annotation-json
>{"created":"2023-07-17T23:11:57.954Z","updated":"2023-07-17T23:11:57.954Z","document":{"title":"newbookc.pdf","link":[{"href":"urn:x-pdf:a37d3c066bae434ae0996e9fbfbcca24"},{"href":"vault:/ComptProg/newbookc.pdf"}],"documentFingerprint":"a37d3c066bae434ae0996e9fbfbcca24"},"uri":"vault:/ComptProg/newbookc.pdf","target":[{"source":"vault:/ComptProg/newbookc.pdf","selector":[{"type":"TextPositionSelector","start":84325,"end":84776},{"type":"TextQuoteSelector","exact":"Method 2Another method for generating permutations is to begin with the permutation{0, 1, . . . , n −1} and repeatedly use a function that constructs the next permu-tation in increasing order. The C++ standard library contains the functionnext_permutation that can be used for this:vector<int> permutation;for (int i = 0; i < n; i++) {permutation.push_back(i);}do {// process permutation} while (next_permutation(permutation.begin(),permutation.end())","prefix":" permutation has been generated.","suffix":");49BacktrackingA backtracking a"}]}]}
>```
>%%
>*%%PREFIX%%permutation has been generated.%%HIGHLIGHT%% ==Method 2Another method for generating permutations is to begin with the permutation{0, 1, . . . , n −1} and repeatedly use a function that constructs the next permu-tation in increasing order. The C++ standard library contains the functionnext_permutation that can be used for this:vector<int> permutation;for (int i = 0; i < n; i++) {permutation.push_back(i);}do {// process permutation} while (next_permutation(permutation.begin(),permutation.end())== %%POSTFIX%%);49BacktrackingA backtracking a*
>%%LINK%%[[#^zsk5h6nb2o|show annotation]]
>%%COMMENT%%
>
>%%TAGS%%
>
^zsk5h6nb2o
