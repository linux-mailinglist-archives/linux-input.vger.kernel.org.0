Return-Path: <linux-input+bounces-9352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC492A155A4
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 18:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 190741623F9
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 17:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EE219E82A;
	Fri, 17 Jan 2025 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+My5vLb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4F25A643;
	Fri, 17 Jan 2025 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737134627; cv=none; b=lfZtgtrmcpHK5l1S+4tn+GBwWdXMxTpbCs2LWHATuIVS+eAMAKGO/jmY8RUNagbxUNwwe1Tl//D/XhQmeJ4x3pR/UXSEsI5L8osk6Z0kpY7MZLWrbeZMoteuYWv/XYL45Qfuj0iujzit+6Q+DqkpMmjliF1alV0SVYopj6i6f5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737134627; c=relaxed/simple;
	bh=nURoB4e7QBrJgHvXp8yeZiUFOJGw3x09wwFkhh69azo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftMv/FJQvF/MF9rUFn2ZxYtRRnzdA+zCEv1S5NY92xYiVUbTsmz+P7h/U7jaDk/zzM806LJJJllNwVMMD4RTtF04eRE0DfSsTA7tlAyObehX/AG6gi1GJwytyjEnL2+dGpIDohuQyEjMvbBqDyWaWV6kW9YIKL6oJ0golAWbQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+My5vLb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21670dce0a7so53841765ad.1;
        Fri, 17 Jan 2025 09:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737134624; x=1737739424; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STpLsOotxffU52N72KpS1QFAMSSvLGsFVIOnQHZCA04=;
        b=c+My5vLbOi+JFwkfjrnSOHuvoDPzNRDTNZhki+h67LBsHmIzOfZoOUlXM/SkUIs0PF
         8Rfn5zmRyQvXU4/26C+SMLOPkL7FWJ+tKKtQ6eL9d0Mj4d9G7G5qLHe0Uuf7yJ3dIr02
         CbHf0CTomBLMZLqYEXc1st/u5y4I4I5m/a4UtvisckZrVzOk98c6Mp8V4IAF1JkSvHJs
         D0dOFx6PSUd7K3320qyu3H7hxi1XhQQIQDSWpdbjUxTrqzg8HxppaQEjNRjy8ZCfjMvz
         9PdzsFrOLcuEZryxjY+oxHRyKtbHVYU1RyYXkNnLUPLtgBY4MQ9TIWxoV6MTnnu5DUxl
         /LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737134624; x=1737739424;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STpLsOotxffU52N72KpS1QFAMSSvLGsFVIOnQHZCA04=;
        b=hmdrkNi2HEREMkmAmXO2hTb/P4/qmR950vjm+LHxlzCl6M81dd3jsTTGwzb6fz94lD
         Q9PyxztR2wgCWnBO62HO7OTmKoQGG4W434lK7W4v1fT8cYmRpCoRhguAL2IqwY9JOlI0
         2Twp2kaXCIsC52ZpZ2r4qXQye12TVRFuVfCrHFEPiUBFCZUvLjhH/jnhJY4dIMEqkqCE
         LhIwOnO5zp1Jk/W/JSPFh6svZkdgbp4tDxtI8F+7aYDjSVVwHP4n5VUq+Te3lQpE+TSr
         O6u/rtTHPubfDVlIuGFS7KYr7PbJOvGGLrOSq1R1LrHZDnCX+l/9TyJlkwgdeV32DpwA
         RlGw==
X-Gm-Message-State: AOJu0YzvsTWMAureq25+JoEMHhw1SwkH4Fzm4T0i2hdkQZZAUJ+nEg9a
	Qur44fTviN4VvZdheFnj3QsH9gLRXlBmHArnarOyWRUBpmP5k6NI33BYtA==
X-Gm-Gg: ASbGnct7CpmnHPDCRHI4bJvSVcbKevl+TijwsB6oP1adPCpocXZUoYKY3tjRELJNUhx
	K3biLbnd0iZgXXjZnYw7ZDR8NtadfhGPp5fyu8f4dLHtffLHlQCveDiv2fg2rbl/2P2gGboQvLq
	GPhi8w1+MJJvpYYXXijqaXWpku55EiFpDDPTuxoz87iH6iHGKQwTdtfI8M+AfE9191IUMZGDo6n
	+z1VW9qGBXPtzsShgqGd9lAxfNtroh1o8NQxKJBClLqRguLLblczDjNug==
X-Google-Smtp-Source: AGHT+IGi7wtYjdApE+3KzV/gT8HY32qFNfP5+okeEOxqaXbRN+4dMQYFFEvilRmpFtwLrZhTyFcxZw==
X-Received: by 2002:a17:902:e74a:b0:216:56c7:98a7 with SMTP id d9443c01a7336-21c35618995mr56279375ad.53.1737134623896;
        Fri, 17 Jan 2025 09:23:43 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5b21:de92:906f:1f41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ace6asm18375355ad.125.2025.01.17.09.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:23:42 -0800 (PST)
Date: Fri, 17 Jan 2025 09:23:40 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Input: synaptics - fix crash when enabling pass-through port
Message-ID: <Z4qSHORvPn7EU2j1@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When enabling a pass-through port an interrupt might come before psmouse
driver binds to the pass-through port. However synaptics sub-driver
tries to access psmouse instance presumably associated with the
pass-through port to figure out if only 1 byte of response or entire
protocol packet needs to be forwarded to the pass-through port and may
crash if psmouse instance has not been attached to the port yet.

Fix the crash by introducing open() and close() methods for the port and
check if the port is open before trying to access psmouse instance.
Because psmouse calls serio_open() only after attaching psmouse instance
to serio port instance this prevents the potential crash.

Reported-by: Takashi Iwai <tiwai@suse.de>
Fixes: 100e16959c3c ("Input: libps2 - attach ps2dev instances as serio port's drvdata")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/synaptics.c | 56 ++++++++++++++++++++++++---------
 drivers/input/mouse/synaptics.h |  1 +
 2 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 2735f86c23cc..aba57abe6978 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -665,23 +665,50 @@ static void synaptics_pt_stop(struct serio *serio)
 	priv->pt_port = NULL;
 }
 
+static int synaptics_pt_open(struct serio *serio)
+{
+	struct psmouse *parent = psmouse_from_serio(serio->parent);
+	struct synaptics_data *priv = parent->private;
+
+	guard(serio_pause_rx)(parent->ps2dev.serio);
+	priv->pt_port_open = true;
+
+	return 0;
+}
+
+static void synaptics_pt_close(struct serio *serio)
+{
+	struct psmouse *parent = psmouse_from_serio(serio->parent);
+	struct synaptics_data *priv = parent->private;
+
+	guard(serio_pause_rx)(parent->ps2dev.serio);
+	priv->pt_port_open = false;
+}
+
 static int synaptics_is_pt_packet(u8 *buf)
 {
 	return (buf[0] & 0xFC) == 0x84 && (buf[3] & 0xCC) == 0xC4;
 }
 
-static void synaptics_pass_pt_packet(struct serio *ptport, u8 *packet)
+static void synaptics_pass_pt_packet(struct synaptics_data *priv, u8 *packet)
 {
-	struct psmouse *child = psmouse_from_serio(ptport);
+	struct serio *ptport;
 
-	if (child && child->state == PSMOUSE_ACTIVATED) {
-		serio_interrupt(ptport, packet[1], 0);
-		serio_interrupt(ptport, packet[4], 0);
-		serio_interrupt(ptport, packet[5], 0);
-		if (child->pktsize == 4)
-			serio_interrupt(ptport, packet[2], 0);
-	} else {
-		serio_interrupt(ptport, packet[1], 0);
+	ptport = priv->pt_port;
+	if (!ptport)
+		return;
+
+	serio_interrupt(ptport, packet[1], 0);
+
+	if (priv->pt_port_open) {
+		struct psmouse *child = psmouse_from_serio(ptport);
+
+		if (child->state == PSMOUSE_ACTIVATED) {
+			serio_interrupt(ptport, packet[4], 0);
+			serio_interrupt(ptport, packet[5], 0);
+			if (child->pktsize == 4)
+				serio_interrupt(ptport, packet[2], 0);
+		}
 	}
 }
 
@@ -720,6 +747,8 @@ static void synaptics_pt_create(struct psmouse *psmouse)
 	serio->write = synaptics_pt_write;
 	serio->start = synaptics_pt_start;
 	serio->stop = synaptics_pt_stop;
+	serio->open = synaptics_pt_open;
+	serio->close = synaptics_pt_close;
 	serio->parent = psmouse->ps2dev.serio;
 
 	psmouse->pt_activate = synaptics_pt_activate;
@@ -1216,11 +1245,10 @@ static psmouse_ret_t synaptics_process_byte(struct psmouse *psmouse)
 
 		if (SYN_CAP_PASS_THROUGH(priv->info.capabilities) &&
 		    synaptics_is_pt_packet(psmouse->packet)) {
-			if (priv->pt_port)
-				synaptics_pass_pt_packet(priv->pt_port,
-							 psmouse->packet);
-		} else
+			synaptics_pass_pt_packet(priv, psmouse->packet);
+		} else {
 			synaptics_process_packet(psmouse);
+		}
 
 		return PSMOUSE_FULL_PACKET;
 	}
diff --git a/drivers/input/mouse/synaptics.h b/drivers/input/mouse/synaptics.h
index 899aee598632..3853165b6b3a 100644
--- a/drivers/input/mouse/synaptics.h
+++ b/drivers/input/mouse/synaptics.h
@@ -188,6 +188,7 @@ struct synaptics_data {
 	bool disable_gesture;			/* disable gestures */
 
 	struct serio *pt_port;			/* Pass-through serio port */
+	bool pt_port_open;
 
 	/*
 	 * Last received Advanced Gesture Mode (AGM) packet. An AGM packet
-- 
2.48.0.rc2.279.g1de40edade-goog


-- 
Dmitry

