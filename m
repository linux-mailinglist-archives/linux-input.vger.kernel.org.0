Return-Path: <linux-input+bounces-8340-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05F9E0247
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 13:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D5F282CD0
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 12:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92B21FCFF5;
	Mon,  2 Dec 2024 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmIGV1/q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086931A9B2A;
	Mon,  2 Dec 2024 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733142854; cv=none; b=AbiEERl8TFUDf79fbVOuvs2gtzT4MKizlh7XbmlHqhMMi2wUW0qdyvqxjRw7BjKoOgnX8IIHi6eH/WkuG+DhG+NWW0RY2x5gNI9zdPTP2h/5vTRa5x0RA7dcfGUA8zqtMNHZSMIFQ6jGrXOZ87eQoBUYhcapvbd3h5VWpPlCKlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733142854; c=relaxed/simple;
	bh=K82C/wSlCQnCagE5Rn+T57wyatHAjCXJw9D440q/x0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aHB2sKniAbdTWpwzPHHOZPvRaySiPaKsp+g2ihQcllQ1lqM1WJO7LTbqZWzSwd4JtqGpeRHchP1Y4n7m0hVlo2X8LKgI1od+HJp32NDsyt56dlx+FNjP408vrjgWl6mNAoanLBLZC5/6ZklB2UslnDtMnftAxUulLHRuLKdjf3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmIGV1/q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385dece873cso1398692f8f.0;
        Mon, 02 Dec 2024 04:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733142851; x=1733747651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2LPxhA5EFsb/CNjbqKNpioL3B8joPuqn0zPyHEcH4Q=;
        b=UmIGV1/q2RPVTO9CGXIP+i94BAnFMSVBzAuxXGHw072PaCPreBErrrysDouAj1B62X
         p6Utk+/ihdBh+Iij4x5Q51jn4JRC7GGxaG5X0JCU30y4hLYfuwT72RHcx8kS0vJWMTsn
         Sq0PKwj3aiMwOClUUK55UR1+tlavtsezr65Sp4Jws2zj4ExEv6Slqf+NBDkqYUED7BL/
         IOsQEufK2Taz1Ifovk8hW9+d+EXWr0Dfed16D8O5h4k1XB9Zl66ESKXh8Dx/8ndkMYUn
         MIxp379XGtQ3omvHCZWTacQCzXIQCRWz24bYTZhgfxWB8eCd6u7QUQkFHHwGsr1odtqQ
         2M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733142851; x=1733747651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2LPxhA5EFsb/CNjbqKNpioL3B8joPuqn0zPyHEcH4Q=;
        b=l4zUmRWVgKe9CbKydlooe0z8m/Wb0EhX/FJVFix7T6jnFxuxlxbE9M7aDsIwmclzyA
         nkt5iAThXf5VOyFHmgsTarf70XkU13DQr8MFM24edPBQs93ra0IIPEoKpANO1lHFzdnP
         GZYmfWfIoH0vrkEKtC4wuhsyXxnh3ozcVDyxZZhfGS0ryLq+dIgLLLe2Vz6bnzWVyh3y
         6jeGiP/VxiWyepfbaDXUewk6Cvqi9iI1+D6KJXBjnSh1iM3SHVY3sLPm8rv6CJv+bPCW
         kfvdvwV4SMwGvBk25Ry1xvWGve5UxogRwidHf9R/8mVLsZtlGWYJRZKfWf552mIk2MCa
         KY8g==
X-Forwarded-Encrypted: i=1; AJvYcCVtiHfnTxtXcf+LMkyywja1hq2A9dHTDRnY/S/sUxj+laH/+VXJtd/57I0dEVW3f1gfBZ30YwaL7MejLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6eblSV5s3Lz115R8b7xh9iEAyOTURJpDMGqh6rWzlPfwTd0hC
	hfwtxK7JxveIsaiGRODjR4cHemdYX8tx9xB3p4f77lQ/ffQtYYs5wy3a6HCM
X-Gm-Gg: ASbGncuUDHUZFLL/08E5KCd8Jr5uo0LeHdpThyi5+J9hsdXxjK6hxHQq+8/S7L4hRqr
	1XjadjNeSKIMUMDhHz2X1RzEu3sJJ8gDrVbgW+ckyqvoA/VthBFJuUeGUHP50B8IVAkMVxjW1M3
	SSIsNeiCJsiUxtC2PPXhzHmvczOstXH2Z+jyCn+KrRfOnIlmh7egrlhBB07UPuh1oVOuCuIA2+L
	0ZyMkusqgf0sWz+T79QvT3MCWFfra6H7x7cOqaIhGMeQx7ikImb3Yvx5GykMz+U/G1HNII=
X-Google-Smtp-Source: AGHT+IGB+sqklW5oXVtwm3qQi3zcPxP9UV+M9Nt1GJC+NPuwZZyXlBrMZWUhKi2/GdtIIQUphDVg1g==
X-Received: by 2002:a05:6000:178d:b0:385:dfab:1643 with SMTP id ffacd0b85a97d-385dfab180cmr10678970f8f.27.1733142850774;
        Mon, 02 Dec 2024 04:34:10 -0800 (PST)
Received: from localhost.localdomain ([90.173.102.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e5b10478sm6712040f8f.73.2024.12.02.04.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:34:10 -0800 (PST)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 0/1] Input: evdev - fix wrong timestamp after SYN_DROPPED
Date: Mon,  2 Dec 2024 13:33:50 +0100
Message-Id: <20241202123351.86957-1-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

We are seeing an issue with gpio_keys where the first event after
a SYN_DROPPED has the same timestamp as the SYN_DROPPED event itself.
After some investigation it looks like this is an issue with evdev
and not specific to gpio_keys.

The issue was originally introduced in commit 3b51c44 ("Input: allow
drivers specify timestamp for input events").

This commit introduced input_set_timestamp and input_get_timestamp.
The latter (despite the name) actually generates and stores a timestamp
in dev->timestamp if the driver did not set one itself. This timestamp
needs to be reset when events are flushed; otherwise the next event
will use a stale timestamp. A partial fix was implemented in 4370b23
("Input: reset device timestamp on sync"), but this does not cover the
case of SYN_DROPPED.

If a SYN_DROPPED is generated (currently only done by evdev), the
following happens:

- evdev calls input_get_timestamp to generate a timestamp for the
  SYN_DROPPED event.
- input_get_timestamp generates a timestamp and stores it in
  dev->timestamp
- When the next real event is reported (in evdev_events), evdev
  calls input_get_timestamp, which uses the timestamp already
  stored in dev->timestamp, which corresponds to the SYN_DROPPED event
  
How to fix:

- When a SYN_DROPPED is generated, after calling input_get_timestamp,
  the timestamp stored in dev->timestamp should be reset (same as is
  currently done in input_handle_event). The attached patch does that.
  
(Perhaps the underlying problem is that it is not expected that a
function called input_get_timestamp will have side effects. The
commit history of input.c shows that this has actually caused a
few issues since 3b51c44.)


Guillermo Rodríguez (1):
  Input: evdev - fix wrong timestamp after SYN_DROPPED event

 drivers/input/evdev.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
2.25.1


