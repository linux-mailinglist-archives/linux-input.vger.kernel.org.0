Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BD44FAB2
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 09:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfFWH65 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 03:58:57 -0400
Received: from mail180-6.suw31.mandrillapp.com ([198.2.180.6]:16755 "EHLO
        mail180-6.suw31.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726263AbfFWH65 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 03:58:57 -0400
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Sun, 23 Jun 2019 03:58:56 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=nexedi.com;
 h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Date:MIME-Version:Content-Type:Content-Transfer-Encoding; i=kirr@nexedi.com;
 bh=SQoaU4CrfNl4Jf6eu/xkbrQQO2NHeGQLLOHbulVuvP0=;
 b=qtGG98YvidblLwr23ePJkHBMiqBQRbeQ/2zrbWbkBoNewy802QLF1b0phIducNSd7Yo0Xtt66Mfa
   grlH0W0lJ45m0XnrLcRXLuDDikw8iEkmllhfxcxAtR8kDY/yM0jX2etmLlcDyhx6ICTOq0o0mkOt
   6ucnvDaz9x1VO90N2sc=
Received: from pmta03.mandrill.prod.suw01.rsglab.com (127.0.0.1) by mail180-6.suw31.mandrillapp.com id h1sok022sc0g for <linux-input@vger.kernel.org>; Sun, 23 Jun 2019 07:29:03 +0000 (envelope-from <bounce-md_31050260.5d0f2a3f.v1-5b8187cdb3ff4dd0aeff25afa99050f8@mandrillapp.com>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1561274943; h=From : 
 Subject : To : Cc : Message-Id : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=SQoaU4CrfNl4Jf6eu/xkbrQQO2NHeGQLLOHbulVuvP0=; 
 b=Nj5FcayRxDKCVgZCOKxhUoD4BrDRN4sDATjn898EEFLP5g2ijbTl0cvfLmjkCCfvnQpxCL
 UYYC9P11sl4Wen5VmDfcGjz5Hp7ds7flFbQhLX8c2dn/4qLTkWdUi7BYhEVibYsz2JuAIISH
 iyZJn4RrelJqnFe3fbrmt8mkAt2Wg=
From:   Kirill Smelkov <kirr@nexedi.com>
Subject: [PATCH 2/2] *: convert stream-like files -> stream_open, even if they use noop_llseek
Received: from [87.98.221.171] by mandrillapp.com id 5b8187cdb3ff4dd0aeff25afa99050f8; Sun, 23 Jun 2019 07:29:03 +0000
X-Mailer: git-send-email 2.20.1
To:     <cocci@systeme.lip6.fr>, <linux-input@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc:     Kirill Smelkov <kirr@nexedi.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Jan Blunck <jblunck@suse.de>, Arnd Bergmann <arnd@arndb.de>,
        Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-Id: <20190623072838.31234-2-kirr@nexedi.com>
In-Reply-To: <20190623072838.31234-1-kirr@nexedi.com>
References: <20190623072838.31234-1-kirr@nexedi.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=31050260.5b8187cdb3ff4dd0aeff25afa99050f8
X-Mandrill-User: md_31050260
Date:   Sun, 23 Jun 2019 07:29:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch continues 10dce8af3422 (fs: stream_open - opener for
stream-like files so that read and write can run simultaneously without
deadlock) and c5bf68fe0c86 (*: convert stream-like files from
nonseekable_open -> stream_open) and teaches steam_open.cocci to
consider files as being stream-like not only if they have
.llseek=no_llseek, but also if they have .llseek=noop_llseek.

This is safe to do: the comment about noop_llseek says

	This is an implementation of ->llseek useable for the rare special case when
	userspace expects the seek to succeed but the (device) file is actually not
	able to perform the seek. In this case you use noop_llseek() instead of
	falling back to the default implementation of ->llseek.

and in general noop_llseek was massively added to drivers in 6038f373a3dc
(llseek: automatically add .llseek fop) when changing default for NULL .llseek
from NOP to no_llseek with the idea to avoid breaking compatibility, if
maybe some user-space program was using lseek on a device without caring
about the result, but caring if it was an error or not.

Amended semantic patch produces two changes when applied tree-wide:

        drivers/hid/hid-sensor-custom.c:690:8-24: WARNING: hid_sensor_custom_fops: .read() has stream semantic; safe to change nonseekable_open -> stream_open.
        drivers/input/mousedev.c:564:1-17: ERROR: mousedev_fops: .read() can deadlock .write(); change nonseekable_open -> stream_open to fix.

Cc: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jan Blunck <jblunck@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Kirill Smelkov <kirr@nexedi.com>
---
 drivers/hid/hid-sensor-custom.c          | 2 +-
 drivers/input/mousedev.c                 | 2 +-
 scripts/coccinelle/api/stream_open.cocci | 9 ++++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-sensor-custom.c b/drivers/hid/hid-sensor-custom.c
index c60f82673cf2..fb827c295842 100644
--- a/drivers/hid/hid-sensor-custom.c
+++ b/drivers/hid/hid-sensor-custom.c
@@ -687,7 +687,7 @@ static int hid_sensor_custom_open(struct inode *inode, struct file *file)
 	if (test_and_set_bit(0, &sensor_inst->misc_opened))
 		return -EBUSY;
 
-	return nonseekable_open(inode, file);
+	return stream_open(inode, file);
 }
 
 static __poll_t hid_sensor_custom_poll(struct file *file,
diff --git a/drivers/input/mousedev.c b/drivers/input/mousedev.c
index 412fa71245af..58afd5253485 100644
--- a/drivers/input/mousedev.c
+++ b/drivers/input/mousedev.c
@@ -561,7 +561,7 @@ static int mousedev_open(struct inode *inode, struct file *file)
 		goto err_free_client;
 
 	file->private_data = client;
-	nonseekable_open(inode, file);
+	stream_open(inode, file);
 
 	return 0;
 
diff --git a/scripts/coccinelle/api/stream_open.cocci b/scripts/coccinelle/api/stream_open.cocci
index 12ce18fa6b74..df00d6619b06 100644
--- a/scripts/coccinelle/api/stream_open.cocci
+++ b/scripts/coccinelle/api/stream_open.cocci
@@ -134,6 +134,13 @@ identifier fops0.fops;
     .llseek = no_llseek,
   };
 
+@ has_noop_llseek @
+identifier fops0.fops;
+@@
+  struct file_operations fops = {
+    .llseek = noop_llseek,
+  };
+
 @ has_mmap @
 identifier fops0.fops;
 identifier mmap_f;
@@ -180,7 +187,7 @@ identifier splice_write_f;
 //
 // XXX for simplicity require no .{read/write}_iter and no .splice_{read/write} for now.
 // XXX maybe_steam.fops cannot be used in other rules - it gives "bad rule maybe_stream or bad variable fops".
-@ maybe_stream depends on (!has_llseek || has_no_llseek) && !has_mmap && !has_copy_file_range && !has_remap_file_range && !has_read_iter && !has_write_iter && !has_splice_read && !has_splice_write @
+@ maybe_stream depends on (!has_llseek || has_no_llseek || has_noop_llseek) && !has_mmap && !has_copy_file_range && !has_remap_file_range && !has_read_iter && !has_write_iter && !has_splice_read && !has_splice_write @
 identifier fops0.fops;
 @@
   struct file_operations fops = {
-- 
2.20.1
