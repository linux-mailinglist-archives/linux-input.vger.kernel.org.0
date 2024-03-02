Return-Path: <linux-input+bounces-2144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DDA86EE18
	for <lists+linux-input@lfdr.de>; Sat,  2 Mar 2024 03:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DE7B1C2149D
	for <lists+linux-input@lfdr.de>; Sat,  2 Mar 2024 02:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99FB7462;
	Sat,  2 Mar 2024 02:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrT3dDB0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32D63AE
	for <linux-input@vger.kernel.org>; Sat,  2 Mar 2024 02:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709345745; cv=none; b=TLMFx0rvnVc2SSzbukYrA6do2arXKLBsK1D08MYVaVuzwsKCcCQuGp+y4HvGqeSfGLHCXlEVDFqLqG/E4KH8R5S8lA5g8a4bkkuHA7Us8Dz9pzdo7Zl2i0D+IB6OlrYoDqq8wKQsv7TrWHji2Vwsw1t/KZ0x8QeP5FW3RVV/nAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709345745; c=relaxed/simple;
	bh=vhqd6a49gqd0CdpWJ4/1IvJwyYEUYi0fnKuNnon/4OI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=mEbgvohszKa86ZvYxKNcVmD1HdGJS9IQhd/8SsNM9kngmPwh1fw4KjI5n3f9y63gyseDIKsnglf9mD0zFulA1lVrfi7dvCaesHlW28lCYyeQI7IiIsE9SnwFoHNLbV4K51XRPb3sx8GEwL/Rxa6+pssSxkZNn1FutQKaJ9Sn4kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrT3dDB0; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-5dca1efad59so2312646a12.2
        for <linux-input@vger.kernel.org>; Fri, 01 Mar 2024 18:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709345744; x=1709950544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhcwgMepaL3JQT2mmebB+j7UvPxSZW8+wt7P4Qfa9E4=;
        b=PrT3dDB0QN/NB8TmIOWQ2iEClDrh4QtzxmK8jZ7r1G/OuI9XIBBrcQmo2E9qBrPVfc
         AaWCPzu3oX7eEPIwrSfO7O/cf1lOVJY9Nnfh2s/wdIIZHfiDRkNn/EbX9t0WIDKoWeMP
         lMgE8tkteC7ZYp5+w4aE3tljt8qRnXPqP9oI28W9C4+VsRmY/K4Gm/Aupcutb/RQ+L6Z
         zG2LfQfMFQIRl3E8dO9aV5PWjCMo/+PzPzpBLyxJWZYgA6jPIq41gyTiLgu0cOrvm9d/
         iefzHuWyKS+TozYfgcgYc6sXzD+oes5yT9MvbnEe3Q4vy9HAuSF5pxGj6QbBd59fK6+o
         DcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709345744; x=1709950544;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OhcwgMepaL3JQT2mmebB+j7UvPxSZW8+wt7P4Qfa9E4=;
        b=wukucTYj0wfitoXWuRlleBAyIO+xgmv3w/JDOX2Wtq9sds/PCpE3mqfgao00SZampA
         FgiM7723V8PakMkKPdOKXxuRVWIWmrhY6d8w4FrZzeeQBdaFveQTkHJ7JhjLcpvZo243
         gwMVjkXGbyxrzleUpxXnLAQi+BzVykAYV8J2L3TZBYjnzyy/BspQBG4f1rxAhOs70L2p
         s8yRn7brd5y2KhCbY4nqViPZw6NIwlZTMGzJEsPQ7RgmFXYa7kDtMK3v/0JDL9g63OSu
         1TA24bknobxTfv0v/4sByUmzSJF23izKNkDwvyxDQ64dK7l53xas2lTdeoA21AOLhzfn
         ++qw==
X-Gm-Message-State: AOJu0Yw1aFWBntnqudFQqJ+9ziQtixPAaX9Yl9ns9LSsRh4445HLR8ns
	YVZe0fn8mNDOCPOfbM8Go1ot/jsW14JipspjqYouyyBn6pdrex0FuhqceWIBy/w=
X-Google-Smtp-Source: AGHT+IHYSiXCxrUI1TqQKH7R20oYawcH9qOkmCIs8lWkvSYLWEwVHFPymd/AfLasc0pH7VND2KysNA==
X-Received: by 2002:a17:902:da85:b0:1dc:e58:8ab4 with SMTP id j5-20020a170902da8500b001dc0e588ab4mr4443881plx.9.1709345743762;
        Fri, 01 Mar 2024 18:15:43 -0800 (PST)
Received: from [10.10.13.50] ([136.226.64.194])
        by smtp.gmail.com with ESMTPSA id w1-20020a170902d10100b001dbb14e6feesm4152608plw.189.2024.03.01.18.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 18:15:43 -0800 (PST)
Message-ID: <44ad5ffa-76d8-4046-94ee-2ef171930ed2@gmail.com>
Date: Fri, 1 Mar 2024 18:15:42 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
From: "Nguyen, Max" <hphyperxdev@gmail.com>
Subject: [PATCH] Input: xpad - Add additional HyperX Controller Identifiers
Cc: linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Add additional HyperX device identifiers to xpad_device and xpad_table. 
Cc: stable@vger.kernel.org Suggested-by: Chris Toledanes<chris.toledanes@hp.com>
Reviewed-by: Carl Ng<carl.ng@hp.com>
Signed-off-by: Max Nguyen<maxwell.nguyen@hp.com>
---

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7c4b2a5cc1b5..a7e001a1f6dc 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -131,6 +131,11 @@ static const struct xpad_device {
  	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
  	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
  	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
+	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },		/* v2 */
+	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
+	{ 0x03f0, 0x038D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wired */
+	{ 0x03f0, 0x048D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wireless */
+	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },
  	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
  	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
  	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
@@ -464,6 +469,7 @@ static const struct usb_device_id xpad_table[] = {
  	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
  	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
  	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
+	XPAD_XBOX360_VENDOR(0x03f0),		/* HP HyperX Xbox 360 controllers */
  	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
  	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */


