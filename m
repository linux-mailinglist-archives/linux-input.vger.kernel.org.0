Return-Path: <linux-input+bounces-8956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBEEA022F3
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 11:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BCE23A3F61
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283051D90AD;
	Mon,  6 Jan 2025 10:30:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail115-76.sinamail.sina.com.cn (mail115-76.sinamail.sina.com.cn [218.30.115.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF21D89FE
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736159401; cv=none; b=fVjvZVQBbAN8Z8KNzjcd6S0o8cP4mZghhVYOQIG5/HRBBz51Fc7H/jSWUbUpaouafuEBLMfZxqTlR7UUOF3NbUOpsmX7T+EOCfCMxodFTZV4DwV7nFBVzBABtW5X/WhR3B7ADtuzI8PcZFZrMrT9San+iLuN929V4Zq1dEwSc6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736159401; c=relaxed/simple;
	bh=QoWn870FkVchYLXoc42burnKR83b2iX9bNVyx8E2cyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bka8nUySJIyBmSbSffGIHWY5O2s0GCh/yQU1eHD+7myxUDwbZLTNV+SsAgJpazNnoQBQzVZRDtXcPW3FAJLwHkcBxBDv8BAGsVEFVxzPOdP7czxrDO1q4qXH+YHZRcjAjHdTYujd4+vi0cFEw7h7NvGeufj3uwq2XgDvoZ1vRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.24.9.62])
	by sina.com (10.185.250.22) with ESMTP
	id 677BB09700001C67; Mon, 6 Jan 2025 18:29:46 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3534597602702
X-SMAIL-UIID: 758CE786654C4CBBACD0B2A49E38F17E-20250106-182946-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+ed7c6209f62eba1565aa@syzkaller.appspotmail.com>
Cc: linux-input@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] possible deadlock in input_ff_flush
Date: Mon,  6 Jan 2025 18:29:33 +0800
Message-ID: <20250106102934.1379-1-hdanton@sina.com>
In-Reply-To: <677a7db3.050a0220.380ff0.0012.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 05 Jan 2025 04:40:19 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    ccb98ccef0e5 Merge tag 'platform-drivers-x86-v6.13-4' of g..
> git tree:       upstream
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17bd56df980000

#syz test

--- x/drivers/input/input.c
+++ y/drivers/input/input.c
@@ -642,17 +642,11 @@ EXPORT_SYMBOL(input_open_device);
 int input_flush_device(struct input_handle *handle, struct file *file)
 {
 	struct input_dev *dev = handle->dev;
-	int retval;
-
-	retval = mutex_lock_interruptible(&dev->mutex);
-	if (retval)
-		return retval;
 
 	if (dev->flush)
-		retval = dev->flush(dev, file);
+		return dev->flush(dev, file);
 
-	mutex_unlock(&dev->mutex);
-	return retval;
+	return 0;
 }
 EXPORT_SYMBOL(input_flush_device);
 
--

