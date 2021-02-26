Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C970325EB8
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 09:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhBZIOX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 03:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhBZIOV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 03:14:21 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A1BC06174A;
        Fri, 26 Feb 2021 00:13:41 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m22so12620112lfg.5;
        Fri, 26 Feb 2021 00:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OqJt217dC4T+T87HRrDiZ5UQcEroafziB7c4ElX1J0M=;
        b=tIF8ucVjW2Xt3YkCytPne8zyP2LJ+O5VNs5QU81NzM3+MvPsnJQMMiRur3kkJ2S8CW
         ljEbo3xtThUyZwLUZwWgq+CrEq6Cozz10w/JyM2luu/USjNqt9esfBYFEoMYUiiV8Kk1
         PWxs63jopYA96hE63AeY2wS51Yy78HLGFWLfy2y4QIp10udGB691Xd8yppahnT6ed0GN
         nzA58NpsG8mzczle5ViMLhS8otiUZx3fC78btPjbbzxx4LZPF8N8rm+G1yqlDB0DV3rG
         lBuf80gRpkfKmB1ar4WGSZua6XtL7X3dFf3pGlTMbZQJCAhk6qgRI/13EkQ1CJw5S4FF
         ClEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OqJt217dC4T+T87HRrDiZ5UQcEroafziB7c4ElX1J0M=;
        b=Zi4JGcSWUrDcNXTZWk2mZ8ZzwX8X3xRGfm1Y7UCVP/ZYFiZGoCjdHEh4jARs6wwioA
         mY12sXV99R6enMGv+CINAX3m4DEINCvPBPPSDgTcHmeKulKbjT39h78uLFlvu/TXEk3L
         pPVG57UJkMrUEsSaJSKumjeyiU8bnQNkQuvJCqhdQ+pSB9/PQCPXv8TaRl0iDRJM+mvk
         LM+DWXU48csukNqfp1lV91ztGr+YGQOrhL3G1bmu4OqNl3eM1kTck6+bsNwjlV7DYGZU
         cR3q0NtXc7yijrm1GycHpRuCkrJnSk2HQeBaGzWTYnfZrzqkmYIWNsIWVUW4ro6zCM89
         p0bQ==
X-Gm-Message-State: AOAM530idOf/WBk9fzF/qFgboM54B/EaaSshAgUarYo34MQXziPruQGT
        Vk+h55kq+F8IhZqXPF9b4rc=
X-Google-Smtp-Source: ABdhPJzVIvesm/SKXS6n7c+2q1ZolirgWPlRr/48kUDI75daMKmMI7nO44d3GOoRM3ZGc6tzsQv/gg==
X-Received: by 2002:a19:858b:: with SMTP id h133mr1133474lfd.86.1614327219701;
        Fri, 26 Feb 2021 00:13:39 -0800 (PST)
Received: from localhost.localdomain ([146.158.65.224])
        by smtp.googlemail.com with ESMTPSA id w6sm1305128lfn.136.2021.02.26.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 00:13:39 -0800 (PST)
From:   Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To:     stern@rowland.harvard.edu
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, snovitoll@gmail.com,
        syzbot+ab02336a647181a886a6@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/hid: fix for the big hid report length
Date:   Fri, 26 Feb 2021 14:13:36 +0600
Message-Id: <20210226081336.3475085-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225155914.GA1350993@rowland.harvard.edu>
References: <20210225155914.GA1350993@rowland.harvard.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 25 Feb 2021 10:59:14 -0500, Alan Stern wrote:
> Won't this cause silent errors?

Agree. But there are already such as cases like in:

// net/bluetooth/hidp/core.c
static void hidp_process_report(..)
{
	..
	if (len > HID_MAX_BUFFER_SIZE)
		len = HID_MAX_BUFFER_SIZE;
	..

// drivers/hid/hid-core.c
int hid_report_raw_event(..)
{
	..
	rsize = hid_compute_report_size(report);

	if (report_enum->numbered && rsize >= HID_MAX_BUFFER_SIZE)
		rsize = HID_MAX_BUFFER_SIZE - 1;
	else if (rsize > HID_MAX_BUFFER_SIZE)
		rsize = HID_MAX_BUFFER_SIZE;
	..

// drivers/staging/greybus/hid.c
static int gb_hid_start(..)
{
	..
	if (bufsize > HID_MAX_BUFFER_SIZE)
		bufsize = HID_MAX_BUFFER_SIZE;
	..

> How about instead just rejecting any device which includes a report 
> whose length is too big (along with an line in the system log explaining 
> what's wrong)?

Not everywhere, but there are already such as logs when > HID_MAX_BUFFER_SIZE

// drivers/hid/hidraw.c
static ssize_t hidraw_send_report(..)
{
	..
	if (count > HID_MAX_BUFFER_SIZE) {
		hid_warn(dev, "pid %d passed too large report\n",
			 task_pid_nr(current));
		ret = -EINVAL;
		goto out;
	}


I've just noticed that hid_compute_report_size() doing the same thing as
hid_report_len(). So I will replace it with latter one with length check.

So in [PATCH v2] I will do following:

 1. replace hid_compute_report_size() with hid_report_len()

 2. in hid_report_len() we can hid_warn() if length > HID_MAX_BUFFER_SIZE,
and return HID_MAX_BUFFER_SIZE. Or we can return 0 in hid_report_len() to let
functions like hid_hw_raw_request(), hid_hw_output_report() to validate
invalid report length and return -EINVAL. Though I'll need to add !length
missing checks in other places.

Please let me know what it's preferred way in 2nd step.
