Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A9F95CBC
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 12:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbfHTK4W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 06:56:22 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50147 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729726AbfHTK4W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 06:56:22 -0400
Received: from orion.localdomain ([95.117.23.32]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MG9c4-1i3MGm2nIi-00GX5c; Tue, 20 Aug 2019 12:56:12 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     pali.rohar@gmail.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net
Subject: [PATCH 1/2] fs: ntfs: drop unneeded likely() call around IS_ERR()
Date:   Tue, 20 Aug 2019 12:56:11 +0200
Message-Id: <1566298572-12409-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:X0bL9kCI73MtDlPdTq2uEsLqyQMLuaPrFjP/C6b4lIR5Z/L0S5C
 AY5OLqdWdxHFXZd+4Qown7BcrfbDwmY64obA51lAQz/MEbVxmhAmacfvsOFnrmNNGsiYVaS
 tBdCnOLL5E1cqSM22KQ+xm8yuxgl9qzumMJ5pVbIYXgirXKuU5OcDEXYIibfxykbJij5I89
 2Ll9OPUhe19o2y2M+mwtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gskhGNcCx2o=:wLmfQXmK0M8LYxKWg7Jf8T
 gK+5tQlYzBITYMavumo+LftMpKxvcaXO+XoEe4Fw94t17B1zhpzL84f/oJCWz4RctllOfGn5l
 dEaGQU3O+N3VyuiTUEbw/HG3z+2rilnqpAOMPu3GzDoQj9aolbQXzAFrPicWBOliIW3JKwdrl
 S7BjrHSXMURRacfM+e+7hP0O+ott1okZEaRyPMg41a+uPiugb2OCa4/keOW2YIaaI8hrDb5yK
 m4uywVsDjw/6o9RGWE4hYR92dq2mobJTrShS2NoasQXyqcQZwG1FEbCXf+xDyAv5AajgNwhHo
 1bO5Ynrsa09v0u5SimM3Ybrd8XbJrEX51pIenksgmID7ArfU1MZZE8qptsVNQ91A4Nod9bi6u
 Z0ZEksWOWBA2g7zwHtBcqteposaulclr2zJApH9RmybgwYO7mOEaBv2umUh8Sk1CbrXxUmpz9
 /SC5+acIGKAvyIXXsfm9JIioJQrc2xWknf3sac21e4rcZkarbh+zaknvnanb6zYu6khU9wkCC
 I7yAKJqfrH6N2JSoD/WV9sEv3Q7tDfJr7nGpW5eaQZWBNOp52wqfNr/AGOKsM6F/10L44q1TE
 XOWl+eKCcm2CUdQ7DHCf5sEMW5CLSi0sqQa9U0X6GyIv7FNTN2F7ldhMvHzSZ5EE+YRpOSjUq
 rtloPtUsASfwbmAfN1IwysVkgTtewuOZyjRr9jrG8Mv4fG0fAlxTsbFd9SUgorkj32FzA+Gms
 xITCZCvNCJf+YhDVPEmNt7O7/5RhetptLlQyBw==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

IS_ERR() already calls unlikely(), so this extra likely() call
around the !IS_ERR() is not needed.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 fs/ntfs/mft.c     | 8 ++++----
 fs/ntfs/namei.c   | 2 +-
 fs/ntfs/runlist.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 20c841a..06f706b 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -71,7 +71,7 @@ static inline MFT_RECORD *map_mft_record_page(ntfs_inode *ni)
 	}
 	/* Read, map, and pin the page. */
 	page = ntfs_map_page(mft_vi->i_mapping, index);
-	if (likely(!IS_ERR(page))) {
+	if (!IS_ERR(page)) {
 		/* Catch multi sector transfer fixup errors. */
 		if (likely(ntfs_is_mft_recordp((le32*)(page_address(page) +
 				ofs)))) {
@@ -154,7 +154,7 @@ MFT_RECORD *map_mft_record(ntfs_inode *ni)
 	mutex_lock(&ni->mrec_lock);
 
 	m = map_mft_record_page(ni);
-	if (likely(!IS_ERR(m)))
+	if (!IS_ERR(m))
 		return m;
 
 	mutex_unlock(&ni->mrec_lock);
@@ -271,7 +271,7 @@ MFT_RECORD *map_extent_mft_record(ntfs_inode *base_ni, MFT_REF mref,
 		m = map_mft_record(ni);
 		/* map_mft_record() has incremented this on success. */
 		atomic_dec(&ni->count);
-		if (likely(!IS_ERR(m))) {
+		if (!IS_ERR(m)) {
 			/* Verify the sequence number. */
 			if (likely(le16_to_cpu(m->sequence_number) == seq_no)) {
 				ntfs_debug("Done 1.");
@@ -1776,7 +1776,7 @@ static int ntfs_mft_data_extend_allocation_nolock(ntfs_volume *vol)
 	do {
 		rl2 = ntfs_cluster_alloc(vol, old_last_vcn, nr, lcn, MFT_ZONE,
 				true);
-		if (likely(!IS_ERR(rl2)))
+		if (!IS_ERR(rl2))
 			break;
 		if (PTR_ERR(rl2) != -ENOSPC || nr == min_nr) {
 			ntfs_error(vol->sb, "Failed to allocate the minimal "
diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 2d3cc9e..4e6a44b 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -115,7 +115,7 @@ static struct dentry *ntfs_lookup(struct inode *dir_ino, struct dentry *dent,
 		dent_ino = MREF(mref);
 		ntfs_debug("Found inode 0x%lx. Calling ntfs_iget.", dent_ino);
 		dent_inode = ntfs_iget(vol->sb, dent_ino);
-		if (likely(!IS_ERR(dent_inode))) {
+		if (!IS_ERR(dent_inode)) {
 			/* Consistency check. */
 			if (is_bad_inode(dent_inode) || MSEQNO(mref) ==
 					NTFS_I(dent_inode)->seq_no ||
diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
index 508744a..97932fb 100644
--- a/fs/ntfs/runlist.c
+++ b/fs/ntfs/runlist.c
@@ -951,7 +951,7 @@ runlist_element *ntfs_mapping_pairs_decompress(const ntfs_volume *vol,
 	}
 	/* Now combine the new and old runlists checking for overlaps. */
 	old_rl = ntfs_runlists_merge(old_rl, rl);
-	if (likely(!IS_ERR(old_rl)))
+	if (!IS_ERR(old_rl))
 		return old_rl;
 	ntfs_free(rl);
 	ntfs_error(vol->sb, "Failed to merge runlists.");
-- 
1.9.1

