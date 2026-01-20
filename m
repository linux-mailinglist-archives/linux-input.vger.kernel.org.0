Return-Path: <linux-input+bounces-17218-lists+linux-input=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-input@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJDrAJCub2lBGgAAu9opvQ
	(envelope-from <linux-input+bounces-17218-lists+linux-input=lfdr.de@vger.kernel.org>)
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 17:34:24 +0100
X-Original-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260047A95
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 17:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF1F6967C7E
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 16:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5247D31AAA3;
	Tue, 20 Jan 2026 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nf82L7pR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE8531A062
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924715; cv=none; b=d749RtrwoM9LRkQ2R5fLPm90Rgb5f9UQ+tLrPsrjH8jelF49fC6ieXIdcGYFz0DeSqyudm2ONpi0Gai2iSHp6cS5HWbdcHvqBiO+wo8IAGKB4csQoIF70Xd8VNKCDopk/hzjaopUV/0wdoQKY+COa3I86ype1opjHNqV560JMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924715; c=relaxed/simple;
	bh=T6khZVEu4yO6n7cyMsL9xnpR0EJEkScoImh4tUPgG08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qV76E4XM2tcbJsIuVFPxzMW2A+7TXsR4ph0QoBlrqYjrMB9xXJe2AzTwffmz8hu2aXI8vm8g/n/T349iqLpsUT3SAK968p1qjtxImr1ilJk2yN/yS8xKLsvljBb86Nuv2HsUOMetPSiBikCZtXWiPUy4SydZ3GvDfiTgfN8Tnpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nf82L7pR; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12331482b8fso10351099c88.1
        for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768924710; x=1769529510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frBpcL96lrZp3lw2toP8kVwHf20apxG75I4AdNkzwnU=;
        b=nf82L7pRxDEGomxA/AE4wohtRNmHJPz+yFLFhjRs46glHCnXRy3V7FG3FYBlse6P/3
         yZa3Qv83rKrG3PB7cpQPhgXLLswPHMtXhFXengVukMgeCbdxhVKTZnRXokdo7biOP3CD
         ANB4zV9VF4L46B8RK2AAkfNl8eSBxTUhSQate5Aq+4N2FPlE9H0ifYafGOJVHrGGRYlk
         lbdK+Fhamg9YXuuvrZn3KXqvHQIcnzYGoiHLzfdSIRNOD95ZFl2Yr4YYQ34ffdi3dzq4
         IYox+dp9Z2IuqmKGkHVFRzLfSt3ZIdb9qmmybqH0ShpsCQfIi5TeOJhSiSiRZu1U9fyg
         UiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924710; x=1769529510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frBpcL96lrZp3lw2toP8kVwHf20apxG75I4AdNkzwnU=;
        b=dYrNRgjfuXS3+9rlpFiIc1wu3sI+Sd5ZGNda4Uy7uTpKbBToZjhj1LwjvGET4lQLt6
         OZ8maHeXwcs3Uz0ozN7Q5yvAldQ1s0kc0qTXuUvIdUWg63jESwBOrW7+ZJluoFkERi+7
         hndKR3OA/QNAlGn2ACs4wuzfyyLsdxJPHpdQXcOqlUBwrmvSlNNHOY9Zk9aDkJMK0gNn
         Xc6RJN7tVmM4Z8zoy5zQYfTmp/E1v6j4yyzxjc8nnsjxmCDP0GyisGvDNgVeztE2fwSf
         VQct/pwqIuYMAEQGSpbXE+zfB1S1ymeyAjBIcVE5hUZyXUPEKamCjNVxdMtySGa6tWK2
         b/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPWSEWueGSO8onThfDVJhztELnfKGJFB9JftgdRM3Bl6vZ9FP0FjIrW4BwU197QlaGSXwgEvHxJFfx0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGII2f+qZwyQDwypntrHiptAHYbfs1J2XoAev783dA9hJycpud
	q70nGnQ5Ywgk3c6UQLydaY6tDWwx3XY/1Ng7s6ekTiEVWeEoQSc2PoKi
X-Gm-Gg: AY/fxX6C/hqqiXEJKipbH71+m8dIFyT0FR5sZG4xa2/u1XIffIsW9yXM06/FUVJLPHX
	FbOW39SMAXBzhY3nPzgSb+En1sn7mnbJUafTxqum8y4RznxoyONdWLod4RAF6Wd/HFfAXcdMkFh
	KLazA2DjmMwJEamA0DM07BMeaAsxHN8SVp29/uBex6POaSLv3sEUh18TrWc54Z2jXCm9VP0aLAo
	kXO55VRJnrO9KlKOjZveLPy2hh1ngwzxrFP2vpj2BvSZzi1UdGpFwoyx9m8SSN0oqcOE434z+1h
	cAdXIUzf1P74NSLUUY/4xJ3BmHiwF95fCDav8iIttSfXfmh35OqGbbZQvJCZHVONnQmjMIqt3Kq
	ICXGXn+Dby/IzYNVXU73lvMhx8LpoIpVy98auPNNzSKidnpAO5qJOnO3kh45+JECdDN4wWhUXCH
	hs7IC4oH/auGkOTcH1B3Sg2uEos9+rGgHiyqGxFjhgJ8aj7hfgYstI
X-Received: by 2002:a05:7022:6990:b0:11f:2c69:32 with SMTP id a92af1059eb24-1244a717f0amr10431170c88.7.1768924709438;
        Tue, 20 Jan 2026 07:58:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm19553169eec.32.2026.01.20.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:58:28 -0800 (PST)
Date: Tue, 20 Jan 2026 07:58:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>, 
	Marco Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v5 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <jp3m5acvoxk7zadzv5h6imqntpyceoaliqw27wlvkydfb2ennz@dbfc4mh44yn6>
References: <20260111-v6-10-topic-touchscreen-axiom-v5-0-f94e0ae266cb@pengutronix.de>
 <20260111-v6-10-topic-touchscreen-axiom-v5-4-f94e0ae266cb@pengutronix.de>
 <20260119211750.udvems44y3u7m4x7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119211750.udvems44y3u7m4x7@pengutronix.de>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-17218-lists,linux-input=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-input@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-input,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,axcfg.py:url,cdu.data:url]
X-Rspamd-Queue-Id: 3260047A95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marco,

On Mon, Jan 19, 2026 at 10:17:50PM +0100, Marco Felsch wrote:
> Hi Dmitry,
> 
> gentle ping since we never received feedback from one of the input
> maintainers.

Some time ago I did few cleanup/fixes to this driver but did not
actually post them. The patch is below, please pick what still makes
sense and then I'll do the full review.

Thanks!

-- 
Dmitry

---
 drivers/input/touchscreen/touchnetix_axiom.c |  989 +++++++++++++-------------
 1 file changed, 495 insertions(+), 494 deletions(-)

diff --git a/drivers/input/touchscreen/touchnetix_axiom.c b/drivers/input/touchscreen/touchnetix_axiom.c
index e8f56a8f7e8a..300e7b76c3b3 100644
--- a/drivers/input/touchscreen/touchnetix_axiom.c
+++ b/drivers/input/touchscreen/touchnetix_axiom.c
@@ -396,24 +396,24 @@ static int axiom_u34_rev1_process_report(struct axiom_data *ts, const u8 *_buf,
 static int axiom_u41_rev2_process_report(struct axiom_data *ts, const u8 *buf,
 					 size_t bufsize);
 
-#define AXIOM_USAGE(num, rev)		\
-	{				\
-		.usage_num = num,	\
-		.rev_num = rev,		\
+#define AXIOM_USAGE(num, rev)			\
+	{					\
+		.usage_num = num,		\
+		.rev_num = rev,			\
 	}
 
-#define AXIOM_RO_USAGE(num, rev)	\
-	{				\
-		.usage_num = num,	\
-		.rev_num = rev,		\
-		.is_ro = true,		\
+#define AXIOM_RO_USAGE(num, rev)		\
+	{					\
+		.usage_num = num,		\
+		.rev_num = rev,			\
+		.is_ro = true,			\
 	}
 
-#define AXIOM_CDU_USAGE(num, rev)	\
-	{				\
-		.usage_num = num,	\
-		.rev_num = rev,		\
-		.is_cdu = true,		\
+#define AXIOM_CDU_USAGE(num, rev)		\
+	{					\
+		.usage_num = num,		\
+		.rev_num = rev,			\
+		.is_cdu = true,			\
 	}
 
 #define AXIOM_REPORT_USAGE(num, rev, func)	\
@@ -511,20 +511,19 @@ static bool axiom_skip_usage_check(struct axiom_data *ts)
 	}
 }
 
-static unsigned int
-axiom_usage_baseaddr(struct axiom_data *ts, unsigned char usage_num)
+static unsigned int axiom_usage_baseaddr(struct axiom_data *ts,
+					 unsigned char usage_num)
 {
 	return ts->usage_table[usage_num].baseaddr;
 }
 
-static unsigned int
-axiom_usage_size(struct axiom_data *ts, unsigned char usage_num)
+static unsigned int axiom_usage_size(struct axiom_data *ts,
+				     unsigned char usage_num)
 {
 	return ts->usage_table[usage_num].size_bytes;
 }
 
-static int
-axiom_usage_rev(struct axiom_data *ts, unsigned char usage_num)
+static int axiom_usage_rev(struct axiom_data *ts, unsigned char usage_num)
 {
 	struct axiom_usage_table_entry *entry = &ts->usage_table[usage_num];
 
@@ -534,8 +533,8 @@ axiom_usage_rev(struct axiom_data *ts, unsigned char usage_num)
 	return entry->info->rev_num;
 }
 
-static bool
-axiom_driver_supports_usage(struct axiom_data *ts, unsigned char usage_num)
+static bool axiom_driver_supports_usage(struct axiom_data *ts,
+					unsigned char usage_num)
 {
 	const struct axiom_usage_info *iter = driver_required_usages;
 	struct device *dev = ts->dev;
@@ -571,14 +570,12 @@ axiom_driver_supports_usage(struct axiom_data *ts, unsigned char usage_num)
 	return false;
 }
 
-static bool
-axiom_usage_entry_is_report(struct axiom_u31_usage_table_entry *entry)
+static bool axiom_usage_entry_is_report(struct axiom_u31_usage_table_entry *entry)
 {
 	return entry->num_pages == 0;
 }
 
-static unsigned int
-axiom_get_usage_size_bytes(struct axiom_u31_usage_table_entry *entry)
+static unsigned int axiom_get_usage_size_bytes(struct axiom_u31_usage_table_entry *entry)
 {
 	unsigned char max_offset;
 
@@ -699,9 +696,9 @@ static bool axiom_usage_supported(struct axiom_data *ts, unsigned int baseaddr)
 
 static void axiom_poll(struct input_dev *input);
 
-static unsigned long
-axiom_wait_for_completion_timeout(struct axiom_data *ts, struct axiom_completion *x,
-				  long timeout)
+static unsigned long axiom_wait_for_completion_timeout(struct axiom_data *ts,
+						       struct axiom_completion *x,
+						       long timeout)
 {
 	struct i2c_client *client = to_i2c_client(ts->dev);
 	unsigned long poll_timeout;
@@ -751,7 +748,7 @@ static void axiom_complete(struct axiom_data *ts, struct axiom_completion *x)
 static int axiom_u02_wait_idle(struct axiom_data *ts)
 {
 	unsigned int reg;
-	int ret, _ret;
+	int error, ret;
 	u16 cmd;
 
 	if (!axiom_driver_supports_usage(ts, AXIOM_U02))
@@ -764,23 +761,24 @@ static int axiom_u02_wait_idle(struct axiom_data *ts)
 	 * Missing regmap_raw_read_poll_timeout for now. RESP_SUCCESS means that
 	 * the last command successfully completed and the device is idle.
 	 */
-	ret = read_poll_timeout(regmap_raw_read, _ret,
-				_ret || cmd == AXIOM_U02_REV1_RESP_SUCCESS,
-				10 * USEC_PER_MSEC, 1 * USEC_PER_SEC, false,
-				ts->regmap, reg, &cmd, 2);
-	if (ret)
+	error = read_poll_timeout(regmap_raw_read, ret,
+				  ret || cmd == AXIOM_U02_REV1_RESP_SUCCESS,
+				  10 * USEC_PER_MSEC, 1 * USEC_PER_SEC, false,
+				  ts->regmap, reg, &cmd, 2);
+	if (error) {
 		dev_err(ts->dev, "Poll u02 timedout with: %#x\n", cmd);
+		return error;
+	}
 
-	return ret;
+	return 0;
 }
 
-static int
-axiom_u02_send_msg(struct axiom_data *ts,
-		   const struct axiom_u02_rev1_system_manager_msg *msg,
-		   bool validate_response)
+static int axiom_u02_send_msg(struct axiom_data *ts,
+			      const struct axiom_u02_rev1_system_manager_msg *msg,
+			      bool validate_response)
 {
 	unsigned int reg;
-	int ret;
+	int error;
 
 	if (!axiom_driver_supports_usage(ts, AXIOM_U02))
 		return -EINVAL;
@@ -788,9 +786,9 @@ axiom_u02_send_msg(struct axiom_data *ts,
 	reg = axiom_usage_baseaddr(ts, AXIOM_U02);
 	reg += AXIOM_U02_REV1_COMMAND_REG;
 
-	ret = regmap_raw_write(ts->regmap, reg, msg, sizeof(*msg));
-	if (ret)
-		return ret;
+	error = regmap_raw_write(ts->regmap, reg, msg, sizeof(*msg));
+	if (error)
+		return error;
 
 	if (!validate_response)
 		return 0;
@@ -798,8 +796,7 @@ axiom_u02_send_msg(struct axiom_data *ts,
 	return axiom_u02_wait_idle(ts);
 }
 
-static int
-axiom_u02_rev1_send_single_cmd(struct axiom_data *ts, u16 cmd)
+static int axiom_u02_rev1_send_single_cmd(struct axiom_data *ts, u16 cmd)
 {
 	struct axiom_u02_rev1_system_manager_msg msg = {
 		.command = cpu_to_le16(cmd)
@@ -826,7 +823,7 @@ static int axiom_u02_stop(struct axiom_data *ts)
 static int axiom_u02_save_config(struct axiom_data *ts)
 {
 	struct axiom_u02_rev1_system_manager_msg msg;
-	int ret;
+	int error;
 
 	if (!axiom_driver_supports_usage(ts, AXIOM_U02))
 		return -EINVAL;
@@ -836,45 +833,48 @@ static int axiom_u02_save_config(struct axiom_data *ts)
 	msg.parameters[1] = cpu_to_le16(AXIOM_U02_REV1_PARAM1_SAVEVLTLCFG2NVM);
 	msg.parameters[2] = cpu_to_le16(AXIOM_U02_REV1_PARAM2_SAVEVLTLCFG2NVM);
 
-	ret = axiom_u02_send_msg(ts, &msg, false);
-	if (ret)
-		return ret;
+	error = axiom_u02_send_msg(ts, &msg, false);
+	if (error)
+		return error;
 
 	/* Downstream axcfg.py waits for 2sec without checking U01 response */
-	ret = axiom_wait_for_completion_timeout(ts, &ts->nvm_write,
-					msecs_to_jiffies(2 * MSEC_PER_SEC));
-	if (!ret)
+	if (!axiom_wait_for_completion_timeout(ts, &ts->nvm_write,
+					       msecs_to_jiffies(2 * MSEC_PER_SEC))) {
 		dev_err(ts->dev, "Error save volatile config timedout\n");
+		return -ETIMEDOUT;
+	}
 
-	return ret ? 0 : -ETIMEDOUT;
+	return 0;
 }
 
 static int axiom_u02_swreset(struct axiom_data *ts)
 {
-	struct axiom_u02_rev1_system_manager_msg msg = { };
-	int ret;
+	struct axiom_u02_rev1_system_manager_msg msg = {
+		.command = cpu_to_le16(AXIOM_U02_REV1_CMD_SOFTRESET),
+	};
+	int error;
 
 	if (!axiom_driver_supports_usage(ts, AXIOM_U02))
 		return -EINVAL;
 
-	msg.command = cpu_to_le16(AXIOM_U02_REV1_CMD_SOFTRESET);
-	ret = axiom_u02_send_msg(ts, &msg, false);
-	if (ret)
-		return ret;
+	error = axiom_u02_send_msg(ts, &msg, false);
+	if (error)
+		return error;
 
 	/*
 	 * Downstream axcfg.py waits for 1sec without checking U01 hello. Tests
 	 * showed that waiting for the hello message isn't enough therefore we
-	 * need both to make it robuster.
+	 * need both to make it more robust.
 	 */
-	ret = axiom_wait_for_completion_timeout(ts, &ts->boot_complete,
-					msecs_to_jiffies(1 * MSEC_PER_SEC));
-	if (!ret)
+	if (!axiom_wait_for_completion_timeout(ts, &ts->boot_complete,
+					       msecs_to_jiffies(1 * MSEC_PER_SEC))) {
 		dev_err(ts->dev, "Error swreset timedout\n");
+		error = -ETIMEDOUT;
+	}
 
 	fsleep(USEC_PER_SEC);
 
-	return ret ? 0 : -ETIMEDOUT;
+	return error;
 }
 
 static int axiom_u02_fillconfig(struct axiom_data *ts)
@@ -897,7 +897,7 @@ static int axiom_u02_enter_bootloader(struct axiom_data *ts)
 	struct axiom_u02_rev1_system_manager_msg msg = { };
 	struct device *dev = ts->dev;
 	unsigned int val;
-	int ret;
+	int error;
 
 	if (!axiom_driver_supports_usage(ts, AXIOM_U02))
 		return -EINVAL;
@@ -908,57 +908,62 @@ static int axiom_u02_enter_bootloader(struct axiom_data *ts)
 	 */
 	msg.command = cpu_to_le16(AXIOM_U02_REV1_CMD_ENTERBOOTLOADER);
 	msg.parameters[0] = cpu_to_le16(AXIOM_U02_REV1_PARAM0_ENTERBOOLOADER_KEY1);
-	ret = axiom_u02_send_msg(ts, &msg, false);
-	if (ret) {
-		dev_err(dev, "Failed to send bootloader-key1: %d\n", ret);
-		return ret;
+	error = axiom_u02_send_msg(ts, &msg, false);
+	if (error) {
+		dev_err(dev, "Failed to send bootloader-key1: %d\n", error);
+		return error;
 	}
 
 	msg.parameters[0] = cpu_to_le16(AXIOM_U02_REV1_PARAM0_ENTERBOOLOADER_KEY2);
-	ret = axiom_u02_send_msg(ts, &msg, false);
-	if (ret) {
-		dev_err(dev, "Failed to send bootloader-key2: %d\n", ret);
-		return ret;
+	error = axiom_u02_send_msg(ts, &msg, false);
+	if (error) {
+		dev_err(dev, "Failed to send bootloader-key2: %d\n", error);
+		return error;
 	}
 
 	msg.parameters[0] = cpu_to_le16(AXIOM_U02_REV1_PARAM0_ENTERBOOLOADER_KEY3);
-	ret = axiom_u02_send_msg(ts, &msg, false);
-	if (ret) {
-		dev_err(dev, "Failed to send bootloader-key3: %d\n", ret);
-		return ret;
+	error = axiom_u02_send_msg(ts, &msg, false);
+	if (error) {
+		dev_err(dev, "Failed to send bootloader-key3: %d\n", error);
+		return error;
 	}
 
 	/* Sleep before the first read to give the device time */
 	fsleep(250 * USEC_PER_MSEC);
 
 	/* Wait till the device reports it is in bootloader mode */
-	return regmap_read_poll_timeout(ts->regmap,
-			AXIOM_U31_REV1_DEVICE_ID_HIGH_REG, val,
-			FIELD_GET(AXIOM_U31_REV1_MODE_MASK, val) ==
-			AXIOM_U31_REV1_MODE_BLP, 250 * USEC_PER_MSEC,
-			USEC_PER_SEC);
+	error = regmap_read_poll_timeout(ts->regmap,
+					 AXIOM_U31_REV1_DEVICE_ID_HIGH_REG, val,
+					 FIELD_GET(AXIOM_U31_REV1_MODE_MASK, val) ==
+						AXIOM_U31_REV1_MODE_BLP,
+					 250 * USEC_PER_MSEC, USEC_PER_SEC);
+	if (error)
+		return error;
+
+	return 0;
 }
 
-static int axiom_u04_get(struct axiom_data *ts, u8 **_buf)
+static u8 *axiom_u04_get(struct axiom_data *ts)
 {
-	u8 buf[AXIOM_U04_REV1_SIZE_BYTES];
 	unsigned int reg;
-	int ret;
+	int error;
 
 	if (!axiom_driver_supports_usage(ts, AXIOM_U04))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
-	reg = axiom_usage_baseaddr(ts, AXIOM_U04);
-	ret = regmap_raw_read(ts->regmap, reg, buf, sizeof(buf));
-	if (ret)
-		return ret;
+	u8 *buf __free(kfree) = kzalloc(AXIOM_U04_REV1_SIZE_BYTES, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
 
-	*_buf = kmemdup(buf, sizeof(buf), GFP_KERNEL);
+	reg = axiom_usage_baseaddr(ts, AXIOM_U04);
+	error = regmap_raw_read(ts->regmap, reg, buf, sizeof(buf));
+	if (error)
+		return ERR_PTR(error);
 
-	return sizeof(buf);
+	return_ptr(buf);
 }
 
-static int axiom_u04_set(struct axiom_data *ts, u8 *buf, unsigned int bufsize)
+static int axiom_u04_set(struct axiom_data *ts, u8 *buf)
 {
 	unsigned int reg;
 
@@ -966,7 +971,7 @@ static int axiom_u04_set(struct axiom_data *ts, u8 *buf, unsigned int bufsize)
 		return -EINVAL;
 
 	reg = axiom_usage_baseaddr(ts, AXIOM_U04);
-	return regmap_raw_write(ts->regmap, reg, buf, bufsize);
+	return regmap_raw_write(ts->regmap, reg, buf, AXIOM_U04_REV1_SIZE_BYTES);
 }
 
 /*
@@ -977,52 +982,52 @@ static int axiom_u31_parse_device_info(struct axiom_data *ts)
 {
 	struct regmap *regmap = ts->regmap;
 	unsigned int id_low, id_high, val;
-	int ret;
+	int error;
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_DEVICE_ID_HIGH_REG, &id_high);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_DEVICE_ID_HIGH_REG, &id_high);
+	if (error)
+		return error;
 	id_high = FIELD_GET(AXIOM_U31_REV1_DEVICE_ID_HIGH_MASK, id_high);
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_DEVICE_ID_LOW_REG, &id_low);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_DEVICE_ID_LOW_REG, &id_low);
+	if (error)
+		return error;
 	ts->device_id = id_high << 8 | id_low;
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_MAJ_REG, &val);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_MAJ_REG, &val);
+	if (error)
+		return error;
 	ts->fw_major = val;
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_MIN_REG, &val);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_MIN_REG, &val);
+	if (error)
+		return error;
 	ts->fw_minor = val;
 
 	/* All other fields are not allowed to be read in BLP mode */
 	if (axiom_get_runmode(ts) == AXIOM_BLP_MODE)
 		return 0;
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_RC_REG, &val);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_RC_REG, &val);
+	if (error)
+		return error;
 	ts->fw_rc = FIELD_GET(AXIOM_U31_REV1_RUNTIME_FW_RC_MASK, val);
 	ts->silicon_rev = FIELD_GET(AXIOM_U31_REV1_SILICON_REV_MASK, val);
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_STATUS_REG, &val);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_RUNTIME_FW_STATUS_REG, &val);
+	if (error)
+		return error;
 	ts->fw_status = FIELD_GET(AXIOM_U31_REV1_RUNTIME_FW_STATUS, val);
 	ts->fw_variant = FIELD_GET(AXIOM_U31_REV1_RUNTIME_FW_VARIANT, val);
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_JEDEC_ID_HIGH_REG, &val);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_JEDEC_ID_HIGH_REG, &val);
+	if (error)
+		return error;
 	ts->jedec_id = val << 8;
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_JEDEC_ID_LOW_REG, &val);
-	if (ret)
-		return ret;
+	error = regmap_read(regmap, AXIOM_U31_REV1_JEDEC_ID_LOW_REG, &val);
+	if (error)
+		return error;
 	ts->jedec_id |= val;
 
 	return 0;
@@ -1032,20 +1037,19 @@ static int axiom_u33_read(struct axiom_data *ts, struct axiom_crc *crc);
 
 static int axiom_u31_device_discover(struct axiom_data *ts)
 {
-	struct axiom_u31_usage_table_entry *u31_usage_table __free(kfree) = NULL;
 	struct axiom_u31_usage_table_entry *entry;
 	struct regmap *regmap = ts->regmap;
 	unsigned int mode, num_usages;
 	struct device *dev = ts->dev;
 	unsigned int i;
-	int ret;
+	int error;
 
 	axiom_set_runmode(ts, AXIOM_DISCOVERY_MODE);
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_DEVICE_ID_HIGH_REG, &mode);
-	if (ret) {
+	error = regmap_read(regmap, AXIOM_U31_REV1_DEVICE_ID_HIGH_REG, &mode);
+	if (error) {
 		dev_err(dev, "Failed to read MODE\n");
-		return ret;
+		return error;
 	}
 
 	/* Abort if the device is in bootloader protocol mode */
@@ -1054,10 +1058,10 @@ static int axiom_u31_device_discover(struct axiom_data *ts)
 		axiom_set_runmode(ts, AXIOM_BLP_MODE);
 
 	/* Since we are not in bootloader mode we can parse the device info */
-	ret = axiom_u31_parse_device_info(ts);
-	if (ret) {
+	error = axiom_u31_parse_device_info(ts);
+	if (error) {
 		dev_err(dev, "Failed to parse device info\n");
-		return ret;
+		return error;
 	}
 
 	/* All other fields are not allowed to be read in BLP mode */
@@ -1066,22 +1070,22 @@ static int axiom_u31_device_discover(struct axiom_data *ts)
 		return -EACCES;
 	}
 
-	ret = regmap_read(regmap, AXIOM_U31_REV1_NUM_USAGES_REG, &num_usages);
-	if (ret) {
+	error = regmap_read(regmap, AXIOM_U31_REV1_NUM_USAGES_REG, &num_usages);
+	if (error) {
 		dev_err(dev, "Failed to read NUM_USAGES\n");
-		return ret;
+		return error;
 	}
 
-	u31_usage_table = kcalloc(num_usages, sizeof(*u31_usage_table),
-				  GFP_KERNEL);
+	struct axiom_u31_usage_table_entry *u31_usage_table __free(kfree) =
+		kcalloc(num_usages, sizeof(*u31_usage_table), GFP_KERNEL);
 	if (!u31_usage_table)
 		return -ENOMEM;
 
-	ret = regmap_raw_read(regmap, AXIOM_U31_REV1_PAGE1, u31_usage_table,
-			      array_size(num_usages, sizeof(*u31_usage_table)));
-	if (ret) {
+	error = regmap_raw_read(regmap, AXIOM_U31_REV1_PAGE1, u31_usage_table,
+				array_size(num_usages, sizeof(*u31_usage_table)));
+	if (error) {
 		dev_err(dev, "Failed to read NUM_USAGES\n");
-		return ret;
+		return error;
 	}
 
 	/*
@@ -1106,7 +1110,7 @@ static int axiom_u31_device_discover(struct axiom_data *ts)
 		if (IS_ERR(info)) {
 			dev_info(dev, "Required usage u%02X isn't supported for rev.%u\n",
 				 entry->usage_num, entry->uifrevision);
-			ret = -EACCES;
+			error = -EACCES;
 		}
 
 		size_bytes = axiom_get_usage_size_bytes(entry);
@@ -1121,20 +1125,24 @@ static int axiom_u31_device_discover(struct axiom_data *ts)
 			ts->max_report_byte_len = size_bytes;
 	}
 
-	if (ret)
-		return ret;
+	if (error)
+		return error;
 
 	/* From now on we are in TCP mode to include usage revision checks */
 	axiom_set_runmode(ts, AXIOM_TCP_MODE);
 
-	return axiom_u33_read(ts, &ts->crc[AXIOM_CRC_CUR]);
+	error = axiom_u33_read(ts, &ts->crc[AXIOM_CRC_CUR]);
+	if (error)
+		return error;
+
+	return 0;
 }
 
 static int axiom_u33_read(struct axiom_data *ts, struct axiom_crc *crc)
 {
 	struct device *dev = ts->dev;
 	unsigned int reg;
-	int ret;
+	int error;
 
 	if (!axiom_driver_supports_usage(ts, AXIOM_U33))
 		return -EINVAL;
@@ -1143,10 +1151,10 @@ static int axiom_u33_read(struct axiom_data *ts, struct axiom_crc *crc)
 		struct axiom_u33_rev2 val;
 
 		reg = axiom_usage_baseaddr(ts, AXIOM_U33);
-		ret = regmap_raw_read(ts->regmap, reg, &val, sizeof(val));
-		if (ret) {
+		error = regmap_raw_read(ts->regmap, reg, &val, sizeof(val));
+		if (error) {
 			dev_err(dev, "Failed to read u33\n");
-			return ret;
+			return error;
 		}
 
 		crc->runtime = le32_to_cpu(val.runtime_crc);
@@ -1160,10 +1168,10 @@ static int axiom_u33_read(struct axiom_data *ts, struct axiom_crc *crc)
 		struct axiom_u33_rev3 val;
 
 		reg = axiom_usage_baseaddr(ts, AXIOM_U33);
-		ret = regmap_raw_read(ts->regmap, reg, &val, sizeof(val));
-		if (ret) {
+		error = regmap_raw_read(ts->regmap, reg, &val, sizeof(val));
+		if (error) {
 			dev_err(dev, "Failed to read u33\n");
-			return ret;
+			return error;
 		}
 
 		crc->runtime = le32_to_cpu(val.runtime_crc);
@@ -1195,31 +1203,22 @@ static bool axiom_u42_touch_enabled(struct axiom_data *ts, const u8 *buf,
 	}
 }
 
-static void axiom_u42_get_touchslots(struct axiom_data *ts)
+static bool axiom_u42_get_touchslots(struct axiom_data *ts)
 {
-	u8 *buf __free(kfree) = NULL;
-	struct device *dev = ts->dev;
 	unsigned int bufsize;
 	unsigned int reg;
-	int ret, i;
-
-	if (!axiom_driver_supports_usage(ts, AXIOM_U42)) {
-		dev_warn(dev, "Use default touchslots num\n");
-		goto fallback;
-	}
+	int error, i;
 
 	bufsize = axiom_usage_size(ts, AXIOM_U42);
-	buf = kzalloc(bufsize, GFP_KERNEL);
-	if (!buf) {
-		dev_warn(dev, "Failed to alloc u42 read buffer, use default value\n");
-		goto fallback;
-	}
+	u8 *buf __free(kfree) = kzalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return false;
 
 	reg = axiom_usage_baseaddr(ts, AXIOM_U42);
-	ret = regmap_raw_read(ts->regmap, reg, buf, bufsize);
-	if (ret) {
-		dev_warn(dev, "Failed to read u42, use default value\n");
-		goto fallback;
+	error = regmap_raw_read(ts->regmap, reg, buf, bufsize);
+	if (error) {
+		dev_warn(ts->dev, "Failed to read u42\n");
+		return false;
 	}
 
 	ts->enabled_slots = 0;
@@ -1232,41 +1231,42 @@ static void axiom_u42_get_touchslots(struct axiom_data *ts)
 		}
 	}
 
-	return;
+	return true;
+}
 
-fallback:
-	ts->enabled_slots = AXIOM_MAX_TOUCHSLOTS_MASK;
-	ts->num_slots = AXIOM_MAX_TOUCHSLOTS;
+static void axiom_get_touchslots(struct axiom_data *ts)
+{
+	if (!axiom_driver_supports_usage(ts, AXIOM_U42) ||
+	    !axiom_u42_get_touchslots(ts)) {
+		dev_warn(ts->dev, "Use default touchslots num\n");
+		ts->enabled_slots = AXIOM_MAX_TOUCHSLOTS_MASK;
+		ts->num_slots = AXIOM_MAX_TOUCHSLOTS;
+	}
 }
 
 static void axiom_u64_cds_enabled(struct axiom_data *ts)
 {
 	unsigned int reg, val;
-	int ret;
-
-	if (!axiom_driver_supports_usage(ts, AXIOM_U64))
-		goto fallback_out;
-
-	reg = axiom_usage_baseaddr(ts, AXIOM_U64);
-	reg += AXIOM_U64_REV2_ENABLECDSPROCESSING_REG;
-
-	ret = regmap_read(ts->regmap, reg, &val);
-	if (ret)
-		goto fallback_out;
+	int error;
 
-	val = FIELD_GET(AXIOM_U64_REV2_ENABLECDSPROCESSING_MASK, val);
-	ts->cds_enabled = val ? true : false;
+	ts->cds_enabled = false;
 
-	return;
+	if (axiom_driver_supports_usage(ts, AXIOM_U64)) {
+		reg = axiom_usage_baseaddr(ts, AXIOM_U64);
+		reg += AXIOM_U64_REV2_ENABLECDSPROCESSING_REG;
 
-fallback_out:
-	ts->cds_enabled = false;
+		error = regmap_read(ts->regmap, reg, &val);
+		if (!error) {
+			val = FIELD_GET(AXIOM_U64_REV2_ENABLECDSPROCESSING_MASK, val);
+			ts->cds_enabled = val ? true : false;
+		}
+	}
 }
 
 static int axiom_cdu_wait_idle(struct axiom_data *ts, u8 cdu_usage_num)
 {
 	unsigned int reg;
-	int ret, _ret;
+	int error, ret;
 	u16 cmd;
 
 	reg = axiom_usage_baseaddr(ts, cdu_usage_num);
@@ -1275,15 +1275,17 @@ static int axiom_cdu_wait_idle(struct axiom_data *ts, u8 cdu_usage_num)
 	 * Missing regmap_raw_read_poll_timeout for now. RESP_SUCCESS means that
 	 * the last command successfully completed and the device is idle.
 	 */
-	ret = read_poll_timeout(regmap_raw_read, _ret,
-				_ret || cmd == AXIOM_CDU_RESP_SUCCESS,
-				10 * USEC_PER_MSEC, 1 * USEC_PER_SEC, false,
-				ts->regmap, reg, &cmd, 2);
-	if (ret)
+	error = read_poll_timeout(regmap_raw_read, ret,
+				  ret || cmd == AXIOM_CDU_RESP_SUCCESS,
+				  10 * USEC_PER_MSEC, 1 * USEC_PER_SEC, false,
+				  ts->regmap, reg, &cmd, 2);
+	if (error) {
 		dev_err(ts->dev, "Poll CDU u%02X timedout with: %#x\n",
 			cdu_usage_num, cmd);
+		return error;
+	}
 
-	return ret;
+	return 0;
 }
 
 /*********************** Report usage handling ********************************/
@@ -1312,8 +1314,8 @@ static int axiom_process_report(struct axiom_data *ts, unsigned char usage_num,
 }
 
 /* Make use of datasheet method 1 - single transfer read */
-static int
-axiom_u34_rev1_process_report(struct axiom_data *ts, const u8 *_buf, size_t bufsize)
+static int axiom_u34_rev1_process_report(struct axiom_data *ts,
+					 const u8 *_buf, size_t bufsize)
 {
 	unsigned int reg = axiom_usage_baseaddr(ts, AXIOM_U34);
 	struct regmap *regmap = ts->regmap;
@@ -1323,11 +1325,11 @@ axiom_u34_rev1_process_report(struct axiom_data *ts, const u8 *_buf, size_t bufs
 	u16 crc_report, crc_calc;
 	unsigned int len;
 	u8 *payload;
-	int ret;
+	int error;
 
-	ret = regmap_raw_read(regmap, reg, buf, ts->max_report_byte_len);
-	if (ret)
-		return ret;
+	error = regmap_raw_read(regmap, reg, buf, ts->max_report_byte_len);
+	if (error)
+		return error;
 
 	/* TODO: Add overflow statistics */
 
@@ -1373,8 +1375,8 @@ axiom_u34_rev1_process_report(struct axiom_data *ts, const u8 *_buf, size_t bufs
 	return 0;
 }
 
-static void
-axiom_u41_rev2_decode_target(const u8 *buf, u8 id, u16 *x, u16 *y, s8 *z)
+static void axiom_u41_rev2_decode_target(const u8 *buf, u8 id,
+					 u16 *x, u16 *y, s8 *z)
 {
 	u16 val;
 
@@ -1389,8 +1391,8 @@ axiom_u41_rev2_decode_target(const u8 *buf, u8 id, u16 *x, u16 *y, s8 *z)
 	*z = buf[AXIOM_U41_REV2_Z_REG(id)];
 }
 
-static int
-axiom_u41_rev2_process_report(struct axiom_data *ts, const u8 *buf, size_t bufsize)
+static int axiom_u41_rev2_process_report(struct axiom_data *ts,
+					 const u8 *buf, size_t bufsize)
 {
 	struct input_dev *input = ts->input;
 	unsigned char id;
@@ -1437,8 +1439,8 @@ axiom_u41_rev2_process_report(struct axiom_data *ts, const u8 *buf, size_t bufsi
 	return 0;
 }
 
-static int
-axiom_u01_rev1_process_report(struct axiom_data *ts, const u8 *buf, size_t bufsize)
+static int axiom_u01_rev1_process_report(struct axiom_data *ts,
+					 const u8 *buf, size_t bufsize)
 {
 	switch (buf[AXIOM_U01_REV1_REPORTTYPE_REG]) {
 	case AXIOM_U01_REV1_REPORTTYPE_HELLO:
@@ -1509,13 +1511,11 @@ static int axiom_regmap_read(void *context, const void *reg_buf, size_t reg_size
 	xfer[1].len = val_size;
 	xfer[1].buf = val_buf;
 
-	ret = i2c_transfer(i2c->adapter, xfer, 2);
-	if (ret == 2)
+	ret = i2c_transfer(i2c->adapter, xfer, ARRAY_SIZE(xfer));
+	if (likely(ret == ARRAY_SIZE(xfer)))
 		return 0;
-	else if (ret < 0)
-		return ret;
-	else
-		return -EIO;
+
+	return ret < 0 ? ret : -EIO;
 }
 
 static int axiom_regmap_write(void *context, const void *data, size_t count)
@@ -1523,7 +1523,6 @@ static int axiom_regmap_write(void *context, const void *data, size_t count)
 	struct device *dev = context;
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct axiom_data *ts = i2c_get_clientdata(i2c);
-	char *buf __free(kfree) = NULL;
 	struct axiom_cmd_header hdr;
 	u16 xferlen, addr, baseaddr;
 	size_t val_size, msg_size;
@@ -1548,7 +1547,7 @@ static int axiom_regmap_write(void *context, const void *data, size_t count)
 		return -EINVAL;
 
 	msg_size = sizeof(hdr) + val_size;
-	buf = kzalloc(msg_size, GFP_KERNEL);
+	u8 *buf __free(kfree) = kzalloc(msg_size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -1556,8 +1555,10 @@ static int axiom_regmap_write(void *context, const void *data, size_t count)
 	memcpy(&buf[sizeof(hdr)], &((char *)data)[2], val_size);
 
 	ret = i2c_master_send(i2c, buf, msg_size);
+	if (likely(ret == msg_size))
+		return 0;
 
-	return ret == msg_size ? 0 : ret;
+	return ret < 0 ? ret : -EIO;
 }
 
 static const struct regmap_config axiom_i2c_regmap_config = {
@@ -1571,29 +1572,20 @@ static const struct regmap_config axiom_i2c_regmap_config = {
 
 static int axiom_update_input_dev(struct axiom_data *ts);
 
-static enum fw_upload_err
-axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
+static enum fw_upload_err __axiom_axfw_fw_prepare(struct axiom_data *ts,
+						  struct axiom_firmware *afw,
+						  const u8 *data, u32 size)
 {
-	struct axiom_data *ts = fw_upload->dd_handle;
-	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_AXFW];
 	u8 major_ver, minor_ver, rc_ver, status, variant;
 	u32 fw_file_crc32, crc32_calc;
 	struct device *dev = ts->dev;
 	unsigned int signature_len;
-	enum fw_upload_err ret;
 	u16 fw_file_format_ver;
 	u16 fw_file_device_id;
 
-	mutex_lock(&afw->lock);
-	afw->cancel = false;
-	mutex_unlock(&afw->lock);
-
-	mutex_lock(&ts->fwupdate_lock);
-
 	if (size < sizeof(struct axiom_fw_axfw_hdr)) {
 		dev_err(dev, "Invalid AXFW file size\n");
-		ret = FW_UPLOAD_ERR_INVALID_SIZE;
-		goto out;
+		return FW_UPLOAD_ERR_INVALID_SIZE;
 	}
 
 	signature_len = strlen(AXIOM_FW_AXFW_SIGNATURE);
@@ -1603,8 +1595,7 @@ axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 		 * ALC don't. Therefore the AXFW format is preferred.
 		 */
 		dev_warn(dev, "No AXFW signature, assume ALC firmware\n");
-		ret = FW_UPLOAD_ERR_NONE;
-		goto out;
+		return FW_UPLOAD_ERR_NONE;
 	}
 
 	fw_file_crc32 = get_unaligned_le32(&data[signature_len]);
@@ -1612,8 +1603,7 @@ axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 	if (fw_file_crc32 != crc32_calc) {
 		dev_err(dev, "AXFW CRC32 doesn't match (fw:%#x calc:%#x)\n",
 			fw_file_crc32, crc32_calc);
-		ret = FW_UPLOAD_ERR_FW_INVALID;
-		goto out;
+		return FW_UPLOAD_ERR_FW_INVALID;
 	}
 
 	data += signature_len + sizeof(fw_file_crc32);
@@ -1621,8 +1611,7 @@ axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 	if (fw_file_format_ver != AXIOM_FW_AXFW_FILE_FMT_VER) {
 		dev_err(dev, "Invalid AXFW file format version: %04x",
 			fw_file_format_ver);
-		ret = FW_UPLOAD_ERR_FW_INVALID;
-		goto out;
+		return FW_UPLOAD_ERR_FW_INVALID;
 	}
 
 	data += sizeof(fw_file_format_ver);
@@ -1630,8 +1619,7 @@ axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 	if (fw_file_device_id != ts->device_id) {
 		dev_err(dev, "Invalid AXFW target device (fw:%#04x dev:%#04x)\n",
 			fw_file_device_id, ts->device_id);
-		ret = FW_UPLOAD_ERR_FW_INVALID;
-		goto out;
+		return FW_UPLOAD_ERR_FW_INVALID;
 	}
 
 	/*
@@ -1640,7 +1628,7 @@ axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 	 *  * downloading the firmware failed in between, or
 	 *  * the following usage discovery failed.
 	 *
-	 *  All cases are crcitical and we need to use any firmware to
+	 *  All cases are critical and we need to use any firmware to
 	 *  bring the device back into a working state which is supported by the
 	 *  host.
 	 */
@@ -1657,19 +1645,32 @@ axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 	if (major_ver == ts->fw_major && minor_ver == ts->fw_minor &&
 	    rc_ver == ts->fw_rc && status == ts->fw_status &&
 	    variant == ts->fw_variant) {
-		ret = FW_UPLOAD_ERR_DUPLICATE;
-		goto out;
+		return FW_UPLOAD_ERR_DUPLICATE;
 	}
 
 	dev_info(dev, "Detected AXFW %02u.%02u.%02u (%s)\n",
 		 major_ver, minor_ver, rc_ver,
 		 status ? "production" : "engineering");
 
-	mutex_lock(&afw->lock);
-	ret = afw->cancel ? FW_UPLOAD_ERR_CANCELED : FW_UPLOAD_ERR_NONE;
-	mutex_unlock(&afw->lock);
+	guard(mutex)(&afw->lock);
+	return afw->cancel ? FW_UPLOAD_ERR_CANCELED : FW_UPLOAD_ERR_NONE;
+}
+
+static enum fw_upload_err axiom_axfw_fw_prepare(struct fw_upload *fw_upload,
+						const u8 *data, u32 size)
+{
+	struct axiom_data *ts = fw_upload->dd_handle;
+	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_AXFW];
+	enum fw_upload_err ret;
+
+	scoped_guard(mutex, &afw->lock) {
+		afw->cancel = false;
+	}
+
+	mutex_lock(&ts->fwupdate_lock);
+
+	ret = __axiom_axfw_fw_prepare(ts, afw, data, size);
 
-out:
 	/*
 	 * In FW_UPLOAD_ERR_NONE case the complete handler will release the
 	 * lock.
@@ -1683,28 +1684,26 @@ axiom_axfw_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 static int axiom_enter_bootloader_mode(struct axiom_data *ts)
 {
 	struct device *dev = ts->dev;
-	int ret;
+	int error;
 
 	axiom_set_runmode(ts, AXIOM_BLP_PRE_MODE);
 
-	ret = axiom_u02_wait_idle(ts);
-	if (ret)
+	error = axiom_u02_wait_idle(ts);
+	if (error)
 		goto err_out;
 
-	ret = axiom_u02_enter_bootloader(ts);
-	if (ret) {
+	error = axiom_u02_enter_bootloader(ts);
+	if (error) {
 		dev_err(dev, "Failed to enter bootloader mode\n");
 		goto err_out;
 	}
 
 	axiom_set_runmode(ts, AXIOM_BLP_MODE);
-
 	return 0;
 
 err_out:
 	axiom_set_runmode(ts, AXIOM_TCP_MODE);
-
-	return ret;
+	return error;
 }
 
 static int axoim_blp_wait_ready(struct axiom_data *ts)
@@ -1727,18 +1726,18 @@ static int axoim_blp_wait_ready(struct axiom_data *ts)
 	return ret;
 }
 
-static int
-axiom_blp_write_chunk(struct axiom_data *ts, const u8 *data, u16 length)
+static int axiom_blp_write_chunk(struct axiom_data *ts,
+				 const u8 *data, u16 length)
 {
 	unsigned int chunk_size = AXIOM_U01_BLP_FIFO_CHK_SIZE_BYTES;
 	unsigned int reg = AXIOM_U01_BLP_FIFO_REG;
 	struct device *dev = ts->dev;
 	unsigned int pos = 0;
-	int ret;
+	int error;
 
-	ret = axoim_blp_wait_ready(ts);
-	if (ret)
-		return ret;
+	error = axoim_blp_wait_ready(ts);
+	if (error)
+		return error;
 
 	/*
 	 * TODO: Downstream does this chunk transfers. Verify if this is
@@ -1751,16 +1750,16 @@ axiom_blp_write_chunk(struct axiom_data *ts, const u8 *data, u16 length)
 		if ((pos + chunk_size) > length)
 			len = length - pos;
 
-		ret = regmap_raw_write(ts->regmap, reg, &data[pos], len);
-		if (ret) {
-			dev_err(dev, "Bootloader download AXFW chunk failed %d\n", ret);
-			return ret;
+		error = regmap_raw_write(ts->regmap, reg, &data[pos], len);
+		if (error) {
+			dev_err(dev, "Bootloader download AXFW chunk failed %d\n", error);
+			return error;
 		}
 
 		pos += len;
-		ret = axoim_blp_wait_ready(ts);
-		if (ret)
-			return ret;
+		error = axoim_blp_wait_ready(ts);
+		if (error)
+			return error;
 	}
 
 	return 0;
@@ -1773,11 +1772,11 @@ static int axiom_blp_reset(struct axiom_data *ts)
 	struct device *dev = ts->dev;
 	unsigned int attempts = 20;
 	unsigned int mode;
-	int ret;
+	int error;
 
-	ret = axoim_blp_wait_ready(ts);
-	if (ret)
-		return ret;
+	error = axoim_blp_wait_ready(ts);
+	if (error)
+		return error;
 
 	/*
 	 * For some reason this write fail with -ENXIO. Skip checking the return
@@ -1787,17 +1786,17 @@ static int axiom_blp_reset(struct axiom_data *ts)
 	regmap_raw_write(ts->regmap, reg, &reset_cmd, sizeof(reset_cmd));
 
 	do {
-		ret = regmap_read(ts->regmap, AXIOM_U31_REV1_DEVICE_ID_HIGH_REG,
-				  &mode);
-		if (!ret)
+		error = regmap_read(ts->regmap, AXIOM_U31_REV1_DEVICE_ID_HIGH_REG,
+				    &mode);
+		if (!error)
 			break;
 
 		fsleep(250 * USEC_PER_MSEC);
 	} while (attempts--);
 
-	if (ret) {
-		dev_err(dev, "Failed to read MODE after BLP reset: %d\n", ret);
-		return ret;
+	if (error) {
+		dev_err(dev, "Failed to read MODE after BLP reset: %d\n", error);
+		return error;
 	}
 
 	mode = FIELD_GET(AXIOM_U31_REV1_MODE_MASK, mode);
@@ -1833,27 +1832,24 @@ static void axiom_unregister_input_dev(struct axiom_data *ts)
 	ts->input = NULL;
 }
 
-static enum fw_upload_err
-axiom_axfw_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
-		    u32 size, u32 *written)
+static enum fw_upload_err axiom_axfw_fw_write(struct fw_upload *fw_upload,
+					      const u8 *data, u32 offset,
+					      u32 size, u32 *written)
 {
 	struct axiom_data *ts = fw_upload->dd_handle;
 	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_AXFW];
 	struct device *dev = ts->dev;
-	bool cancel;
-	int ret;
+	int error;
 
 	/* Done before cancel check due to cleanup based put */
-	ret = pm_runtime_resume_and_get(ts->dev);
-	if (ret)
+	error = pm_runtime_resume_and_get(ts->dev);
+	if (error)
 		return FW_UPLOAD_ERR_HW_ERROR;
 
-	mutex_lock(&afw->lock);
-	cancel = afw->cancel;
-	mutex_unlock(&afw->lock);
-
-	if (cancel)
-		return FW_UPLOAD_ERR_CANCELED;
+	scoped_guard(mutex, &afw->lock) {
+		if (afw->cancel)
+			return FW_UPLOAD_ERR_CANCELED;
+	}
 
 	axiom_lock_input_device(ts);
 
@@ -1883,8 +1879,8 @@ axiom_axfw_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 		 * The bootlaoder FW can handle the complete chunk incl. the
 		 * header.
 		 */
-		ret = axiom_blp_write_chunk(ts, data, len);
-		if (ret)
+		error = axiom_blp_write_chunk(ts, data, len);
+		if (error)
 			goto err;
 
 		size -= len;
@@ -1892,12 +1888,12 @@ axiom_axfw_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 		data += len;
 	}
 
-	ret = axiom_blp_reset(ts);
-	if (ret)
+	error = axiom_blp_reset(ts);
+	if (error)
 		dev_warn(dev, "BLP reset failed\n");
 
-	ret = axiom_u31_device_discover(ts);
-	if (ret) {
+	error = axiom_u31_device_discover(ts);
+	if (error) {
 		/*
 		 * This is critical and we need to avoid that the user-space can
 		 * still use the input-dev.
@@ -1911,8 +1907,8 @@ axiom_axfw_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 	/* Unlock before the input device gets unregistered */
 	axiom_unlock_input_device(ts);
 
-	ret = axiom_update_input_dev(ts);
-	if (ret) {
+	error = axiom_update_input_dev(ts);
+	if (error) {
 		dev_err(dev, "Input device update failed after AXFW/ALC firmware update\n");
 		return FW_UPLOAD_ERR_HW_ERROR;
 	}
@@ -1936,9 +1932,8 @@ static void axiom_axfw_fw_cancel(struct fw_upload *fw_upload)
 	struct axiom_data *ts = fw_upload->dd_handle;
 	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_AXFW];
 
-	mutex_lock(&afw->lock);
+	guard(mutex)(&afw->lock);
 	afw->cancel = true;
-	mutex_unlock(&afw->lock);
 }
 
 static void axiom_axfw_fw_cleanup(struct fw_upload *fw_upload)
@@ -1958,8 +1953,8 @@ static const struct fw_upload_ops axiom_axfw_fw_upload_ops = {
 	.cleanup = axiom_axfw_fw_cleanup,
 };
 
-static int
-axiom_set_new_crcs(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *cfg)
+static int axiom_set_new_crcs(struct axiom_data *ts,
+			      const struct axiom_fw_cfg_chunk *cfg)
 {
 	struct axiom_crc *crc = &ts->crc[AXIOM_CRC_NEW];
 	const u32 *u33_data = (const u32 *)cfg->usage_content;
@@ -1987,8 +1982,8 @@ axiom_set_new_crcs(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *cfg)
 	return 0;
 }
 
-static unsigned int
-axiom_cfg_fw_prepare_chunk(struct axiom_fw_cfg_chunk *chunk, const u8 *data)
+static unsigned int axiom_cfg_fw_prepare_chunk(struct axiom_fw_cfg_chunk *chunk,
+					       const u8 *data)
 {
 	chunk->usage_num = data[0];
 	chunk->usage_rev = data[1];
@@ -2017,46 +2012,37 @@ static bool axiom_cfg_fw_update_required(struct axiom_data *ts)
 	    !axiom_usage_crc_match(ts, AXIOM_U22, cur, new, u22_sequencedata) ||
 	    !axiom_usage_crc_match(ts, AXIOM_U43, cur, new, u43_hotspots) ||
 	    !axiom_usage_crc_match(ts, AXIOM_U93, cur, new, u93_profiles) ||
-	    !axiom_usage_crc_match(ts, AXIOM_U94, cur, new, u94_deltascalemap))
+	    !axiom_usage_crc_match(ts, AXIOM_U94, cur, new, u94_deltascalemap)) {
 		return true;
+	}
 
 	return false;
 }
 
-static enum fw_upload_err
-axiom_cfg_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
+static enum fw_upload_err __axiom_cfg_fw_prepare(struct axiom_data *ts,
+						 struct axiom_firmware *afw,
+						 const u8 *data, u32 size)
 {
-	struct axiom_data *ts = fw_upload->dd_handle;
-	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_CFG];
 	u32 cur_runtime_crc, fw_runtime_crc;
 	struct axiom_fw_cfg_chunk chunk;
 	struct device *dev = ts->dev;
-	enum fw_upload_err ret;
 	u32 signature;
-
-	mutex_lock(&afw->lock);
-	afw->cancel = false;
-	mutex_unlock(&afw->lock);
-
-	mutex_lock(&ts->fwupdate_lock);
+	int error;
 
 	if (axiom_get_runmode(ts) != AXIOM_TCP_MODE) {
 		dev_err(dev, "Device not in TCP mode, abort TH2CFG update\n");
-		ret = FW_UPLOAD_ERR_HW_ERROR;
-		goto out;
+		return FW_UPLOAD_ERR_HW_ERROR;
 	}
 
 	if (size < sizeof(struct axiom_fw_cfg_hdr)) {
 		dev_err(dev, "Invalid TH2CFG file size\n");
-		ret = FW_UPLOAD_ERR_INVALID_SIZE;
-		goto out;
+		return FW_UPLOAD_ERR_INVALID_SIZE;
 	}
 
 	signature = get_unaligned_be32(data);
 	if (signature != AXIOM_FW_CFG_SIGNATURE) {
 		dev_err(dev, "Invalid TH2CFG signature\n");
-		ret = FW_UPLOAD_ERR_FW_INVALID;
-		goto out;
+		return FW_UPLOAD_ERR_FW_INVALID;
 	}
 
 	/* Skip to the first fw chunk */
@@ -2080,39 +2066,47 @@ axiom_cfg_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 
 	if (size == 0) {
 		dev_err(dev, "Failed to find the u33 entry in TH2CFG\n");
-		ret = FW_UPLOAD_ERR_FW_INVALID;
-		goto out;
+		return FW_UPLOAD_ERR_FW_INVALID;
 	}
 
-	ret = axiom_set_new_crcs(ts, &chunk);
-	if (ret) {
-		ret = FW_UPLOAD_ERR_FW_INVALID;
-		goto out;
-	}
+	error = axiom_set_new_crcs(ts, &chunk);
+	if (error)
+		return FW_UPLOAD_ERR_FW_INVALID;
 
 	/*
 	 * Nothing to do if the CRCs are the same. TODO: Must be extended once
 	 * the CDU update is added.
 	 */
-	if (!axiom_cfg_fw_update_required(ts)) {
-		ret = FW_UPLOAD_ERR_DUPLICATE;
-		goto out;
-	}
+	if (!axiom_cfg_fw_update_required(ts))
+		return FW_UPLOAD_ERR_DUPLICATE;
 
 	cur_runtime_crc = ts->crc[AXIOM_CRC_CUR].runtime;
 	fw_runtime_crc = ts->crc[AXIOM_CRC_NEW].runtime;
 	if (cur_runtime_crc != fw_runtime_crc) {
 		dev_err(dev, "TH2CFG and device runtime CRC doesn't match: %#x != %#x\n",
 			fw_runtime_crc, cur_runtime_crc);
-		ret = FW_UPLOAD_ERR_FW_INVALID;
-		goto out;
+		return FW_UPLOAD_ERR_FW_INVALID;
+	}
+
+	guard(mutex)(&afw->lock);
+	return afw->cancel ? FW_UPLOAD_ERR_CANCELED : FW_UPLOAD_ERR_NONE;
+}
+
+static enum fw_upload_err axiom_cfg_fw_prepare(struct fw_upload *fw_upload,
+					       const u8 *data, u32 size)
+{
+	struct axiom_data *ts = fw_upload->dd_handle;
+	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_CFG];
+	enum fw_upload_err ret;
+
+	scoped_guard(mutex, &afw->lock) {
+		afw->cancel = false;
 	}
 
-	mutex_lock(&afw->lock);
-	ret = afw->cancel ? FW_UPLOAD_ERR_CANCELED : FW_UPLOAD_ERR_NONE;
-	mutex_unlock(&afw->lock);
+	mutex_lock(&ts->fwupdate_lock);
+
+	ret = __axiom_cfg_fw_prepare(ts, afw, data, size);
 
-out:
 	/*
 	 * In FW_UPLOAD_ERR_NONE case the complete handler will release the
 	 * lock.
@@ -2125,27 +2119,26 @@ axiom_cfg_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
 
 static int axiom_zero_volatile_mem(struct axiom_data *ts)
 {
-	int ret, size;
-	u8 *buf;
+	int error;
 
 	/* Zero out the volatile memory except for the user content in u04 */
-	ret = axiom_u04_get(ts, &buf);
-	if (ret < 0)
-		return ret;
-	size = ret;
+	u8 *buf __free(kfree) = axiom_u04_get(ts);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
 
-	ret = axiom_u02_fillconfig(ts);
-	if (ret)
-		goto out;
+	error = axiom_u02_fillconfig(ts);
+	if (error)
+		return error;
 
-	ret = axiom_u04_set(ts, buf, size);
-out:
-	kfree(buf);
-	return ret;
+	error = axiom_u04_set(ts, buf);
+	if (error)
+		return error;
+
+	return 0;
 }
 
-static bool
-axiom_skip_cfg_chunk(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *chunk)
+static bool axiom_skip_cfg_chunk(struct axiom_data *ts,
+				 const struct axiom_fw_cfg_chunk *chunk)
 {
 	u8 usage_num = chunk->usage_num;
 
@@ -2156,21 +2149,22 @@ axiom_skip_cfg_chunk(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *chu
 
 	/* Skip read-only usages */
 	if (ts->usage_table[usage_num].info &&
-	    ts->usage_table[usage_num].info->is_ro)
+	    ts->usage_table[usage_num].info->is_ro) {
 		return true;
+	}
 
 	return false;
 }
 
-static int
-axiom_write_cdu_usage(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *chunk)
+static int axiom_write_cdu_usage(struct axiom_data *ts,
+				 const struct axiom_fw_cfg_chunk *chunk)
 {
 	struct axiom_cdu_usage cdu = { };
 	struct device *dev = ts->dev;
 	unsigned int remaining;
 	unsigned int reg;
 	unsigned int pos;
-	int ret;
+	int error;
 
 	pos = 0;
 	remaining = chunk->usage_length;
@@ -2189,17 +2183,17 @@ axiom_write_cdu_usage(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *ch
 		memset(cdu.data, 0, sizeof(cdu.data));
 		memcpy(cdu.data, &chunk->usage_content[pos], size);
 
-		ret = regmap_raw_write(ts->regmap, reg, &cdu, sizeof(cdu));
-		if (ret) {
+		error = regmap_raw_write(ts->regmap, reg, &cdu, sizeof(cdu));
+		if (error) {
 			dev_err(dev, "Failed to write CDU u%02X\n",
 				chunk->usage_num);
-			return ret;
+			return error;
 		}
 
-		ret = axiom_cdu_wait_idle(ts, chunk->usage_num);
-		if (ret) {
+		error = axiom_cdu_wait_idle(ts, chunk->usage_num);
+		if (error) {
 			dev_err(dev, "CDU write wait-idle failed\n");
-			return ret;
+			return error;
 		}
 
 		remaining -= size;
@@ -2215,59 +2209,65 @@ axiom_write_cdu_usage(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *ch
 	cdu.parameters[0] = cpu_to_le16(AXIOM_CDU_PARAM0_COMMIT);
 	cdu.parameters[1] = cpu_to_le16(AXIOM_CDU_PARAM1_COMMIT);
 
-	ret = regmap_raw_write(ts->regmap, reg, &cdu, sizeof(cdu));
-	if (ret) {
+	error = regmap_raw_write(ts->regmap, reg, &cdu, sizeof(cdu));
+	if (error) {
 		dev_err(dev, "Failed to commit CDU u%02X to NVM\n",
 			chunk->usage_num);
-		return ret;
+		return error;
 	}
 
-	ret = axiom_wait_for_completion_timeout(ts, &ts->nvm_write,
-					msecs_to_jiffies(5 * MSEC_PER_SEC));
-	if (!ret) {
+	if (!axiom_wait_for_completion_timeout(ts, &ts->nvm_write,
+					       msecs_to_jiffies(5 * MSEC_PER_SEC))) {
 		dev_err(ts->dev, "Error CDU u%02X commit timedout\n",
 			chunk->usage_num);
 		return -ETIMEDOUT;
 	}
 
-	return axiom_cdu_wait_idle(ts, chunk->usage_num);
+	error = axiom_cdu_wait_idle(ts, chunk->usage_num);
+	if (error)
+		return error;
+
+	return 0;
 }
 
-static int
-axiom_write_cfg_chunk(struct axiom_data *ts, const struct axiom_fw_cfg_chunk *chunk)
+static int axiom_write_cfg_chunk(struct axiom_data *ts,
+				 const struct axiom_fw_cfg_chunk *chunk)
 {
 	unsigned int reg;
-	int ret;
+	int error;
 
 	if (ts->usage_table[chunk->usage_num].info &&
 	    ts->usage_table[chunk->usage_num].info->is_cdu) {
-		ret = axiom_write_cdu_usage(ts, chunk);
-		if (ret)
-			return ret;
-		goto out;
+		error = axiom_write_cdu_usage(ts, chunk);
+		if (error)
+			return error;
+	} else {
+		reg = axiom_usage_baseaddr(ts, chunk->usage_num);
+		error = regmap_raw_write(ts->regmap, reg, chunk->usage_content,
+					 chunk->usage_length);
+		if (error)
+			return error;
 	}
 
-	reg = axiom_usage_baseaddr(ts, chunk->usage_num);
-	ret = regmap_raw_write(ts->regmap, reg, chunk->usage_content, chunk->usage_length);
-	if (ret)
-		return ret;
+	error = axiom_u02_wait_idle(ts);
+	if (error)
+		return error;
 
-out:
-	return axiom_u02_wait_idle(ts);
+	return 0;
 }
 
 static int axiom_verify_volatile_mem(struct axiom_data *ts)
 {
-	int ret;
+	int error;
 
-	ret = axiom_u02_computecrc(ts);
-	if (ret)
-		return ret;
+	error = axiom_u02_computecrc(ts);
+	if (error)
+		return error;
 
 	/* Query the new CRCs after they are re-computed */
-	ret = axiom_u33_read(ts, &ts->crc[AXIOM_CRC_CUR]);
-	if (ret)
-		return ret;
+	error = axiom_u33_read(ts, &ts->crc[AXIOM_CRC_CUR]);
+	if (error)
+		return error;
 
 	return ts->crc[AXIOM_CRC_CUR].vltusageconfig ==
 	       ts->crc[AXIOM_CRC_NEW].vltusageconfig ? 0 : -EINVAL;
@@ -2310,27 +2310,24 @@ static int axiom_verify_crcs(struct axiom_data *ts)
 	return 0;
 }
 
-static enum fw_upload_err
-axiom_cfg_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
-		   u32 size, u32 *written)
+static enum fw_upload_err axiom_cfg_fw_write(struct fw_upload *fw_upload,
+					     const u8 *data, u32 offset,
+					     u32 size, u32 *written)
 {
 	struct axiom_data *ts = fw_upload->dd_handle;
 	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_CFG];
 	struct device *dev = ts->dev;
-	bool cancel;
-	int ret;
+	int error;
 
 	/* Done before cancel check due to cleanup based put */
-	ret = pm_runtime_resume_and_get(ts->dev);
-	if (ret)
+	error = pm_runtime_resume_and_get(ts->dev);
+	if (error)
 		return FW_UPLOAD_ERR_HW_ERROR;
 
-	mutex_lock(&afw->lock);
-	cancel = afw->cancel;
-	mutex_unlock(&afw->lock);
-
-	if (cancel)
-		return FW_UPLOAD_ERR_CANCELED;
+	scoped_guard(mutex, &afw->lock) {
+		if (afw->cancel)
+			return FW_UPLOAD_ERR_CANCELED;
+	}
 
 	axiom_lock_input_device(ts);
 
@@ -2340,12 +2337,12 @@ axiom_cfg_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 		return FW_UPLOAD_ERR_HW_ERROR;
 	}
 
-	ret = axiom_u02_stop(ts);
-	if (ret)
+	error = axiom_u02_stop(ts);
+	if (error)
 		goto err_swreset;
 
-	ret = axiom_zero_volatile_mem(ts);
-	if (ret)
+	error = axiom_zero_volatile_mem(ts);
+	if (error)
 		goto err_swreset;
 
 	/* Skip to the first fw chunk */
@@ -2362,16 +2359,14 @@ axiom_cfg_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 		chunk_len = axiom_cfg_fw_prepare_chunk(&chunk, data);
 		if (axiom_skip_cfg_chunk(ts, &chunk)) {
 			dev_dbg(dev, "Skip TH2CFG usage u%02X\n", chunk.usage_num);
-			goto next_chunk;
-		}
-
-		ret = axiom_write_cfg_chunk(ts, &chunk);
-		if (ret) {
-			axiom_set_runmode(ts, AXIOM_TCP_MODE);
-			goto err_swreset;
+		} else {
+			error = axiom_write_cfg_chunk(ts, &chunk);
+			if (error) {
+				axiom_set_runmode(ts, AXIOM_TCP_MODE);
+				goto err_swreset;
+			}
 		}
 
-next_chunk:
 		data += chunk_len;
 		size -= chunk_len;
 		*written += chunk_len;
@@ -2380,28 +2375,28 @@ axiom_cfg_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 	axiom_set_runmode(ts, AXIOM_TCP_MODE);
 
 	/* Ensure that the chunks are written correctly */
-	ret = axiom_verify_volatile_mem(ts);
-	if (ret) {
+	error = axiom_verify_volatile_mem(ts);
+	if (error) {
 		dev_err(dev, "Failed to verify written config, abort\n");
 		goto err_swreset;
 	}
 
-	ret = axiom_u02_save_config(ts);
-	if (ret)
+	error = axiom_u02_save_config(ts);
+	if (error)
 		goto err_swreset;
 
 	/*
 	 * TODO: Check if u02 start would be sufficient to load the new config
 	 * values
 	 */
-	ret = axiom_u02_swreset(ts);
-	if (ret) {
+	error = axiom_u02_swreset(ts);
+	if (error) {
 		dev_err(dev, "Soft reset failed\n");
 		goto err_unlock;
 	}
 
-	ret = axiom_u33_read(ts, &ts->crc[AXIOM_CRC_CUR]);
-	if (ret)
+	error = axiom_u33_read(ts, &ts->crc[AXIOM_CRC_CUR]);
+	if (error)
 		goto err_unlock;
 
 	if (axiom_verify_crcs(ts))
@@ -2410,8 +2405,8 @@ axiom_cfg_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 	/* Unlock before the input device gets unregistered */
 	axiom_unlock_input_device(ts);
 
-	ret = axiom_update_input_dev(ts);
-	if (ret) {
+	error = axiom_update_input_dev(ts);
+	if (error) {
 		dev_err(dev, "Input device update failed after TH2CFG firmware update\n");
 		goto err_out;
 	}
@@ -2425,7 +2420,7 @@ axiom_cfg_fw_write(struct fw_upload *fw_upload, const u8 *data, u32 offset,
 err_unlock:
 	axiom_unlock_input_device(ts);
 err_out:
-	return ret == -ETIMEDOUT ? FW_UPLOAD_ERR_TIMEOUT : FW_UPLOAD_ERR_HW_ERROR;
+	return error == -ETIMEDOUT ? FW_UPLOAD_ERR_TIMEOUT : FW_UPLOAD_ERR_HW_ERROR;
 }
 
 static void axiom_cfg_fw_cancel(struct fw_upload *fw_upload)
@@ -2433,9 +2428,8 @@ static void axiom_cfg_fw_cancel(struct fw_upload *fw_upload)
 	struct axiom_data *ts = fw_upload->dd_handle;
 	struct axiom_firmware *afw = &ts->fw[AXIOM_FW_CFG];
 
-	mutex_lock(&afw->lock);
+	guard(mutex)(&afw->lock);
 	afw->cancel = true;
-	mutex_unlock(&afw->lock);
 }
 
 static void axiom_cfg_fw_cleanup(struct fw_upload *fw_upload)
@@ -2474,7 +2468,7 @@ static int axiom_register_fwl(struct axiom_data *ts)
 	struct device *dev = ts->dev;
 	struct fw_upload *fwl;
 	char *fw_name;
-	int ret;
+	int error;
 
 	if (!IS_ENABLED(CONFIG_FW_UPLOAD)) {
 		dev_dbg(dev, "axfw and th2cfgbin update disabled\n");
@@ -2490,9 +2484,9 @@ static int axiom_register_fwl(struct axiom_data *ts)
 		return dev_err_probe(dev, PTR_ERR(fwl),
 				     "Failed to register firmware upload\n");
 
-	ret = devm_add_action_or_reset(dev, axiom_remove_axfw_fwl_action, ts);
-	if (ret)
-		return ret;
+	error = devm_add_action_or_reset(dev, axiom_remove_axfw_fwl_action, ts);
+	if (error)
+		return error;
 
 	ts->fw[AXIOM_FW_AXFW].fwl = fwl;
 
@@ -2505,9 +2499,9 @@ static int axiom_register_fwl(struct axiom_data *ts)
 		return dev_err_probe(dev, PTR_ERR(fwl),
 				     "Failed to register cfg firmware upload\n");
 
-	ret = devm_add_action_or_reset(dev, axiom_remove_cfg_fwl_action, ts);
-	if (ret)
-		return ret;
+	error = devm_add_action_or_reset(dev, axiom_remove_cfg_fwl_action, ts);
+	if (error)
+		return error;
 
 	ts->fw[AXIOM_FW_CFG].fwl = fwl;
 
@@ -2643,7 +2637,7 @@ static int axiom_register_input_dev(struct axiom_data *ts,
 	struct device *dev = ts->dev;
 	struct i2c_client *client = to_i2c_client(dev);
 	struct input_dev *input;
-	int ret;
+	int error;
 
 	input = input_allocate_device();
 	if (!input) {
@@ -2673,7 +2667,7 @@ static int axiom_register_input_dev(struct axiom_data *ts,
 
 	touchscreen_parse_properties(input, true, &ts->prop);
 
-	axiom_u42_get_touchslots(ts);
+	axiom_get_touchslots(ts);
 	if (!ts->num_slots && update_in_process) {
 		input_free_device(input);
 		/*
@@ -2690,11 +2684,11 @@ static int axiom_register_input_dev(struct axiom_data *ts,
 		return -EINVAL;
 	}
 
-	ret = input_mt_init_slots(input, ts->num_slots, INPUT_MT_DIRECT);
-	if (ret) {
+	error = input_mt_init_slots(input, ts->num_slots, INPUT_MT_DIRECT);
+	if (error) {
 		input_free_device(input);
 		dev_err(dev, "Failed to init mt slots\n");
-		return ret;
+		return error;
 	}
 
 	/*
@@ -2705,19 +2699,21 @@ static int axiom_register_input_dev(struct axiom_data *ts,
 	 * always.
 	 */
 	if (!ts->irq_setup_done && client->irq) {
-		ret = devm_request_threaded_irq(dev, client->irq, NULL, axiom_irq,
-						IRQF_ONESHOT, dev_name(dev), ts);
-		if (ret) {
+		error = devm_request_threaded_irq(dev, client->irq,
+						  NULL, axiom_irq,
+						  IRQF_ONESHOT,
+						  dev_name(dev), ts);
+		if (error) {
 			dev_err(dev, "Failed to request IRQ\n");
-			return ret;
+			return error;
 		}
 		ts->irq_setup_done = true;
 	} else {
-		ret = input_setup_polling(input, axiom_poll);
-		if (ret) {
+		error = input_setup_polling(input, axiom_poll);
+		if (error) {
 			input_free_device(input);
 			dev_err(dev, "Setup polling mode failed\n");
-			return ret;
+			return error;
 		}
 
 		input_set_poll_interval(input, ts->poll_interval);
@@ -2726,14 +2722,14 @@ static int axiom_register_input_dev(struct axiom_data *ts,
 	input_set_drvdata(input, ts);
 	ts->input = input;
 
-	ret = input_register_device(input);
-	if (ret) {
+	error = input_register_device(input);
+	if (error) {
 		input_free_device(input);
 		ts->input = NULL;
 		dev_err(dev, "Failed to register input device\n");
 	};
 
-	return ret;
+	return error;
 }
 
 static int axiom_update_input_dev(struct axiom_data *ts)
@@ -2747,15 +2743,15 @@ static int axiom_parse_firmware(struct axiom_data *ts)
 {
 	struct device *dev = ts->dev;
 	struct gpio_desc *gpio;
-	int ret;
+	int error;
 
 	ts->supplies[0].supply = "vddi";
 	ts->supplies[1].supply = "vdda";
 	ts->num_supplies = ARRAY_SIZE(ts->supplies);
 
-	ret = devm_regulator_bulk_get(dev, ts->num_supplies, ts->supplies);
-	if (ret)
-		return dev_err_probe(dev, ret,
+	error = devm_regulator_bulk_get(dev, ts->num_supplies, ts->supplies);
+	if (error)
+		return dev_err_probe(dev, error,
 				     "Failed to get power supplies\n");
 
 	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
@@ -2770,20 +2766,15 @@ static int axiom_parse_firmware(struct axiom_data *ts)
 	return 0;
 }
 
-static int axiom_power_device(struct axiom_data *ts, unsigned int enable)
+static int axiom_power_up_device(struct axiom_data *ts)
 {
 	struct device *dev = ts->dev;
-	int ret;
-
-	if (!enable) {
-		regulator_bulk_disable(ts->num_supplies, ts->supplies);
-		return 0;
-	}
+	int error;
 
-	ret = regulator_bulk_enable(ts->num_supplies, ts->supplies);
-	if (ret) {
+	error = regulator_bulk_enable(ts->num_supplies, ts->supplies);
+	if (error) {
 		dev_err(dev, "Failed to enable power supplies\n");
-		return ret;
+		return error;
 	}
 
 	gpiod_set_value_cansleep(ts->reset_gpio, 1);
@@ -2795,6 +2786,11 @@ static int axiom_power_device(struct axiom_data *ts, unsigned int enable)
 	return 0;
 }
 
+static void axiom_power_down_device(struct axiom_data *ts)
+{
+	regulator_bulk_disable(ts->num_supplies, ts->supplies);
+}
+
 static int axiom_panel_prepared(struct drm_panel_follower *follower)
 {
 	struct axiom_data *ts = container_of(follower, struct axiom_data,
@@ -2838,7 +2834,7 @@ static int axiom_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct axiom_data *ts;
-	int ret;
+	int error;
 
 	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
@@ -2857,53 +2853,56 @@ static int axiom_i2c_probe(struct i2c_client *client)
 	init_completion(&ts->nvm_write.completion);
 	mutex_init(&ts->fwupdate_lock);
 
-	ret = axiom_register_fwl(ts);
-	if (ret)
-		return ret;
+	error = axiom_register_fwl(ts);
+	if (error)
+		return error;
 
-	ret = axiom_parse_firmware(ts);
-	if (ret)
-		return ret;
+	error = axiom_parse_firmware(ts);
+	if (error)
+		return error;
 
-	ret = axiom_power_device(ts, 1);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to power-on device\n");
+	error = axiom_power_up_device(ts);
+	if (error)
+		return dev_err_probe(dev, error, "Failed to power-on device\n");
 
 	pm_runtime_set_autosuspend_delay(dev, 10 * MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_get_noresume(dev);
-	ret = devm_pm_runtime_enable(dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to enable pm-runtime\n");
+	error = devm_pm_runtime_enable(dev);
+	if (error)
+		return dev_err_probe(dev, error, "Failed to enable pm-runtime\n");
 
-	ret = axiom_register_panel_follower(ts);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register panel follower\n");
+	error = axiom_register_panel_follower(ts);
+	if (error)
+		return dev_err_probe(dev, error, "Failed to register panel follower\n");
 
-	ret = axiom_u31_device_discover(ts);
+	error = axiom_u31_device_discover(ts);
 	/*
 	 * Register the device to allow FW updates in case that the current FW
 	 * doesn't support the required driver usages or if the device is in
 	 * bootloader mode.
 	 */
-	if (ret && ret == -EACCES && IS_ENABLED(CONFIG_FW_UPLOAD)) {
-		dev_warn(dev, "Device discovery failed, wait for user fw update\n");
-		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_sync_autosuspend(dev);
-		return 0;
-	} else if (ret) {
+	if (error) {
+		if (error == -EACCES && IS_ENABLED(CONFIG_FW_UPLOAD)) {
+			dev_warn(dev, "Device discovery failed, wait for user fw update\n");
+			pm_runtime_mark_last_busy(dev);
+			pm_runtime_put_sync_autosuspend(dev);
+			return 0;
+		}
 		pm_runtime_put_sync(dev);
-		return dev_err_probe(dev, ret, "Device discovery failed\n");
+		return dev_err_probe(dev, error, "Device discovery failed\n");
 	}
 
-	ret = axiom_register_input_dev(ts, false);
+	error = axiom_register_input_dev(ts, false);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_sync_autosuspend(dev);
-	if (ret && IS_ENABLED(CONFIG_FW_UPLOAD))
+	if (error) {
+		if (!IS_ENABLED(CONFIG_FW_UPLOAD))
+			return dev_err_probe(dev, error, "Failed to register input device\n");
+
 		dev_warn(dev, "Failed to register the input device, wait for user fw update\n");
-	else if (ret)
-		return dev_err_probe(dev, ret, "Failed to register input device\n");
+	}
 
 	return 0;
 }
@@ -2923,18 +2922,20 @@ static int axiom_runtime_suspend(struct device *dev)
 	if (client->irq && ts->irq_setup_done)
 		disable_irq(client->irq);
 
-	return axiom_power_device(ts, 0);
+	axiom_power_down_device(ts);
+
+	return 0;
 }
 
 static int axiom_runtime_resume(struct device *dev)
 {
 	struct axiom_data *ts = dev_get_drvdata(dev);
 	struct i2c_client *client = to_i2c_client(dev);
-	int ret;
+	int error;
 
-	ret = axiom_power_device(ts, 1);
-	if (ret)
-		return ret;
+	error = axiom_power_up_device(ts);
+	if (error)
+		return error;
 
 	if (client->irq && ts->irq_setup_done)
 		enable_irq(client->irq);

