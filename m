Return-Path: <linux-input+bounces-16282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B13C7C8D3
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 07:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41C864E167F
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 06:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C4D2144D7;
	Sat, 22 Nov 2025 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQdXtnsK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE372AD00
	for <linux-input@vger.kernel.org>; Sat, 22 Nov 2025 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763794037; cv=none; b=s59KIZ2HgBUv45bz0ejS6sH6gXREhFHq+e3jw/x8NqMWCtfQpErZf3wc7vZv5rZLBNRaqHY0m7y8Wg8ZQeVtT6ec6O58g5ocjSIom/g4gsfSSWfIFBAtuddbwoH/kQON/P3wIlBhqPG0dR0wkuEVIdZDOYoBYansntmRYA2FHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763794037; c=relaxed/simple;
	bh=Uy5EBL9ryOvcuUb1Ww0ajpOtzqeN5fwHgVcJN+Rc/u0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjVNNxEmuk2wNYlyHc8Ohrndd3PWkZvFFzC4HoobskGINs6xDxwXDRm5YCWeXkTpxZj+uA2MAxvIGZKhqGAWjyU4nXi8Bl6H9oUkiOVElG6RykPaJ4ohU8+dNDRDAwhYlkEJOGodZg+i1PUDpwE6kdi13hlxKV1Qo0SZIq6Y/AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQdXtnsK; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2a45877bd5eso3894522eec.0
        for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 22:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763794035; x=1764398835; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceroZ4u+zWprBwIaHbqT81vyTjPO028Wln0q3zx0hiI=;
        b=TQdXtnsKYcIPLk6bPtmY2rztTWU81aIfPNz1TY/fSAMYl+wwixE/aT+P9dpZJdfhwZ
         fLQBdou6rWA4ZtfmG9+DhnM+JURzLGkyOVPvcRAL6HBx3Wuu7JgjpCra7qEAUP8qKMg9
         XJWqaKV0GArq8HO/0RfUB+FIaNU5X5+mlnnAEmAKlyv2bfneXxROV6Usxyb1NBbRymYb
         q05QGVlhczLDCIFCM3lzckip8BKMxLzMLfv7sq+7CLMHld9m3z5xyOzVylCY3arGhJDI
         f5Soa9f151/CfAyQLcYBeaA2ZSgWNYyBq3FPsEnKCIRigSU1dQjTxxl+/Ykfu3Xa18me
         IgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763794035; x=1764398835;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceroZ4u+zWprBwIaHbqT81vyTjPO028Wln0q3zx0hiI=;
        b=r4EhNk2h0PwjL0DQf+thCMTI+9M52p7kAWe7IArPq9bMB0PFGq59IMDnevu4hEHmQu
         R9Tfc2/ZL5IHprZVC3c+R0Ef8dhiVZ6nH5N9BM8ZP/9URmgipYulnbuHOBxaYWq3c7Qo
         XYOfmKaw46NuRBEqJ1ZmeKXy11aVL5y2orhcw4lDCyNwlc3w57pR6G0Xjl144kzwOkeN
         g3knHqzd3HTBGeCZseARbMbpPWmXTIOcoyiGSa1bFBD6AwJPfFJqiOGibsafCfzR0xTV
         HGlcRcYrtD4HRUNFuo3ganalqxMBrI16Hawfvyx8cWAOuRxOXq0wvGDeFLQ/m+g15+bd
         jp2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqM0CARUQiDspe911DtzBO87Y/nOwHz4f3fntfPxJhriM3zYa4O1haUGSKxOZ76xkANOnUIsdB1c2yIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMnNYCKEJ91mhy7lTbeQ+BdhJAQrrFRWXfzn7y31Om0OmtdnF
	wj8lK1wv1H7yHdYl7YgF2eO1wbbg8RPEoRN+LWgfNYBXazZ9BJwXvtZX
X-Gm-Gg: ASbGncu04sWMJIr+vf75nPNkDlWFE5VDHTulZ8upJxFSPI4PoYkw5sWJKpcDMqMW1GL
	/AFHR9BiAx/TrT1hriXr+TZi5r3koT4ZRCeR+RVZOmZZ8mqcj4OPbcUjOUBMTn0N1jIL/Ow01oj
	1fG9tsDNUsFSp4bR5mUyxStId54sVNNRU1O726rcbODXjglPDFM54D/y7/16qzkqr6EpRutMPNc
	1zb+jOnIm4BXq3HKy0WsGU8KMK17dDO9tfKEMnWvPbzdhA58vPweR4cil2J+XPdm0xbHDFDhd26
	LUIuFYmR8dZiGifBUbki0uMwM98OG3+DCES7QlMkQusTeXNgP/Z26/qGFcnNGbdbwuukHMxB5uP
	YsfeHDvJ3o22J2qXpto3Yq+rIPN4lY77uw550NOJieuZxkT3p/q5cjFzprR0MH7z5ufLcPAPYqC
	tBCUUqOO+9rCV51nqlNopxXcPbItbJE+oKDAFvBrbiR6BwTHcg6PLu
X-Google-Smtp-Source: AGHT+IGi6+LksQrQNQRm2me/Zd7hbHIFHnFLNUzLcYfewyFXibECwPLjlPB2yafXlqfdu5OEad/y9g==
X-Received: by 2002:a05:7301:1001:b0:2a4:7294:f7b7 with SMTP id 5a478bee46e88-2a7188dc3aamr2557727eec.16.1763794034941;
        Fri, 21 Nov 2025 22:47:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:2009:6689:bde0:1b79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc204881sm32553359eec.0.2025.11.21.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 22:47:14 -0800 (PST)
Date: Fri, 21 Nov 2025 22:47:12 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.18-rc6
Message-ID: <s7ye6uffvflxyk543emnmjsqyjc6d22scy6qcr52zegssmdtwj@wswhzowey34g>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.18-rc6

to receive updates for the input subsystem. You will get:

- INPUT_PROP_HAPTIC_TOUCHPAD definition added early in 6.18 cycle has
  been renamed to INPUT_PROP_PRESSUREPAD to better reflect the kind of
  devices it is supposed to be set for

- a new ID for a touchscreen found in Ayaneo Flip DS in Goodix driver

- Goodix driver no longer tries to set reset pin as "input" as it causes
  issues when there is no pull up resistor installed on the board

- fixes for cros_ec_keyb, imx_sc_key, and pegasus-notetaker drivers to
  deal with potential out-of-bounds access and memory corruption issues

Changelog:
---------

Dan Carpenter (1):
      Input: imx_sc_key - fix memory corruption on unload

Hans de Goede (1):
      Input: goodix - add support for ACPI ID GDIX1003

Martyn Welch (1):
      Input: goodix - remove setting of RST pin to input

Peter Hutterer (1):
      Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to INPUT_PROP_PRESSUREPAD

Seungjin Bae (1):
      Input: pegasus-notetaker - fix potential out-of-bounds access

Tzung-Bi Shih (1):
      Input: cros_ec_keyb - fix an invalid memory access

Diffstat:
--------

 Documentation/input/event-codes.rst      | 25 ++++++++++++++++++-------
 driveruntime/detectrs/hid/hid-haptic.c                 |  2 +-
 drivers/input/keyboard/cros_ec_keyb.c    |  6 ++++++
 drivers/input/keyboard/imx_sc_key.c      |  2 +-
 drivers/input/tablet/pegasus_notetaker.c |  9 +++++++++
 drivers/input/touchscreen/goodix.c       | 28 ++--------------------------
 drivers/input/touchscreen/goodix.h       |  1 -
 include/uapi/linux/input-event-codes.h   |  2 +-
 8 files changed, 38 insertions(+), 37 deletions(-)

Thanks.

-- 
Dmitry

