Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE37E4881E4
	for <lists+linux-input@lfdr.de>; Sat,  8 Jan 2022 07:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiAHGqK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Jan 2022 01:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiAHGqJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 8 Jan 2022 01:46:09 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E04C06173E
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 22:46:09 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id h1so6698119pls.11
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 22:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tDvuS8BnGebyVFOAY/uhAVOmPK399miSdD1tYKxRZBE=;
        b=Or0cRMerLIUL6X5SYsle5y0mUIa4mtcLjfzJXVKuWOPrpQJPA56fcqenPMOD74Y89E
         w3mZXJwJFLqAO5Djxi/v+x8iP6OXSBJHqG0FRNdEfTBBTXwtqIvw0pImfIQO8c5fvkkK
         oEdeE+mbs2AqO3rflxd8G0BSpsTKQUl6lo8beQAG6MS27CvcFfJ1xtosV5y8CTmFfBcy
         5uslf3ng83haA3GX7lezEEKG2VHmmafMdfliU0mVLvhdKodmLki9WEt4+7yz0dC5H8aB
         Q9/2qlaYV5tM3xzPyQIZ4L4e6emzwhkMVOhsdBN9868dv0GKYQlwi54utWxJVegJpoZK
         q5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tDvuS8BnGebyVFOAY/uhAVOmPK399miSdD1tYKxRZBE=;
        b=LNtCFtRdt4tmNCb+BMGqnTnK6OLiVQoukDLiflNHJqBdVmNrliPCBpMsEHE9qM/wp6
         0VD0Vopq2tx/Of7SzHYnh1xQ4dMoNCYhCHwK1JdvKVWuXT1MqJUeccj8pGGGr7P7aFjT
         gVduGYTTeZsPpCPKZTH9NBh4h9ZQLTDm07gwwxQ+/M00lgpMXfZr4rNGHHmV9ToKM42K
         joO2bpbuu5qp/QM2rB8BH311LACo7o/pMRXViJI4l/m6/nB44/bWYvjL/KOfMZ3CwcDS
         KJZtHajVa5jlhWyEGinWH6WWgJ19mJlNPrHlo21slFtHGL5WNCych5406bhcDx7sz2tP
         2tpA==
X-Gm-Message-State: AOAM532tWp0Dgx3cX0dzvkPI8ttxamp5FoNeB6NBuaAsOEZU9VlYmOst
        zT7WMQcH85vfNTJrdeOk0RM=
X-Google-Smtp-Source: ABdhPJyvFj5QQ18oP0bNG9ZYLmenspw0xWxVJtOd5d/OyET/2XvdLZpLW6Rvr+IxfTCkM1Tc5s/TMg==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id lx14mr19617193pjb.66.1641624369081;
        Fri, 07 Jan 2022 22:46:09 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id w6sm725913pga.25.2022.01.07.22.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 22:46:07 -0800 (PST)
Date:   Fri, 7 Jan 2022 22:46:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 18/18] HID: i2c-hid: fix i2c_hid_set_or_send_report
Message-ID: <YdkzLZzDIgWrel0O@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-19-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-19-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, Dec 21, 2021 at 07:17:43PM +0000, Angela Czubak wrote:
> If command & data registers are to be used and report ID >= 0xF
> use the sentinel value for report ID in the command.
> Do not alter the report ID itself as it needs to be inserted into the args
> buffer. If output register is to be used there is no need to insert
> report IDs >= 0xF.

OK, I see what you mean, but I believe that i2c_hid_set_or_send_report()
is the wrong place to implement this handling to begin with. How about a
modified version of your patch that I am pasting below (not tested)?

Thanks,
Dmitry

-- >8 -- >8 --


HID: i2c-hid: fix handling numbered reports with IDs of 15 and above

From: Angela Czubak <acz@semihalf.com>

Special handling of numbered reports with IDs of 15 and above is only
needed when executing what HID-I2C spec is calling "Class Specific
Requests", and not when simply sending output reports.

Additionally, our mangling of report ID in i2c_hid_set_or_send_report()
resulted in incorrect report ID being written into SET_REPORT command
payload.

To solve it let's move all the report ID manipulation into
__i2c_hid_command() where we form the command data structure.

Signed-off-by: Angela Czubak <acz@semihalf.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c |   22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 517141138b00..9381a70b2948 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -97,6 +97,7 @@ union command {
 		__le16 reg;
 		__u8 reportTypeID;
 		__u8 opcode;
+		__u8 reportID;
 	} __packed c;
 };
 
@@ -232,7 +233,13 @@ static int __i2c_hid_command(struct i2c_client *client,
 
 	if (length > 2) {
 		cmd->c.opcode = command->opcode;
-		cmd->c.reportTypeID = reportID | reportType << 4;
+		if (reportID < 0x0F) {
+			cmd->c.reportTypeID = reportType << 4 | reportID;
+		} else {
+			cmd->c.reportTypeID = reportType << 4 | 0x0F;
+			cmd->c.reportID = reportID;
+			length++;
+		}
 	}
 
 	memcpy(cmd->data + length, args, args_len);
@@ -300,11 +307,6 @@ static int i2c_hid_get_report(struct i2c_client *client, u8 reportType,
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
-	if (reportID >= 0x0F) {
-		args[args_len++] = reportID;
-		reportID = 0x0F;
-	}
-
 	args[args_len++] = readRegister & 0xFF;
 	args[args_len++] = readRegister >> 8;
 
@@ -350,18 +352,12 @@ static int i2c_hid_set_or_send_report(struct i2c_client *client, u8 reportType,
 	size =		2			/* size */ +
 			(reportID ? 1 : 0)	/* reportID */ +
 			data_len		/* buf */;
-	args_len =	(reportID >= 0x0F ? 1 : 0) /* optional third byte */ +
-			2			/* dataRegister */ +
+	args_len =	2			/* dataRegister */ +
 			size			/* args */;
 
 	if (!use_data && maxOutputLength == 0)
 		return -ENOSYS;
 
-	if (reportID >= 0x0F) {
-		args[index++] = reportID;
-		reportID = 0x0F;
-	}
-
 	/*
 	 * use the data register for feature reports or if the device does not
 	 * support the output register
