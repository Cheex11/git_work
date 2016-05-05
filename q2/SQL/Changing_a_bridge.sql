--Update Greeting
update GIT_PhNumconfig set legreeting_slot='sf###ims' where frn_GIT_PhNumid=2362487
update xGIT_PhNum_platform set legreeting_slot='sf###ms' where frn_GIT_PhNumid=2362487

--Update virtual forward for when extension 1 is selected
update GIT_PhNum
set GIT_PhNum_to_be_dialed = 'v8#######6'
where GIT_PhNumid = ######

--Update virtual forward for when extension 2 is selected
update GIT_PhNum
set GIT_PhNum_to_be_dialed = 'v8########9'
where GIT_PhNumid = ######

--Update label of new line for extension 1
update GIT_PhNum 
set label1 = 'Desjardins Claims'
where dnidid = #######

--Update label of new line for extension 2
update GIT_PhNum 
set label1 = 'CCC Service'
where dnidid = 3504305

--Publish the changes
insert into GIT_PhNumpublish(frn_GIT_PhNumid,node)
values(#####,1001),(######,1001)