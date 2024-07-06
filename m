Return-Path: <linux-input+bounces-4881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1289B9295FE
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 01:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7103DB2129D
	for <lists+linux-input@lfdr.de>; Sat,  6 Jul 2024 23:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3EA77F13;
	Sat,  6 Jul 2024 23:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec7CGA1h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A9757FC;
	Sat,  6 Jul 2024 23:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720310058; cv=none; b=jP5v4hXt8UEZ5UU+ZdZ5MuEcT4CpsOD1fKXAU4n7P069i5HqNZqNXQIRbmv5ECQ9nlycoud0lSvgT+9+hyH0oh1+LsWGI3l1ADnrjGT8faSxBYo+dhxiwpfKSP2Xp/ce+fSE/HNQC/dyiNr2B9zYrtP89oQ+IK8QgeS73k9EBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720310058; c=relaxed/simple;
	bh=tQZE+yvLdfcAriqqKjQn68N/FqDQMhVHYTqcmUeyadc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OPnEqbAv+qx9wgqtyuHXayugwJ1MmZc5l//3c97MLNjNZF2o8Gl2zD0d2EBuOMgjpV2xRLI8iFQSPcHLv/DpbvO50j25WVeaL0ktjBasYuSqwz81IGCSwvDAMFI5kv82mr9Q1b3n8+NRQQhw9zj3r7SatFQQTMU5N0qi62n/5lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec7CGA1h; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso28479581fa.2;
        Sat, 06 Jul 2024 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720310054; x=1720914854; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkBRl4JZWQbks3co99KOiKCP10Ez5zuclfcztvGtTA0=;
        b=Ec7CGA1hsmL6bS84SDy2AY3yg937ga+M/037mBIfBPqniSPPNeY8kI4m5xfei0AfTM
         J8gw2dhoutYrd8XeWCsGZz6eJguY4Osvqy6SH+pWtFMLZSOSPSCBwgOeH1ZihvkvRSVf
         h6Qgs6QuCexGwjlkYe7IpwZqKHO2DY/VSGjpsDnH+M2K2uczw9Xl5yD9VQI+IYskZ/sS
         aeamuX1gE/xSWMEJwOOuyQI2xFx6IULZLZMRdi2Js9r85Czmq6EZ6OpIo+WTTYG231ob
         GI5WOhF2rAo34Juli3x404lZ+czOL2yBe0DJYgrGrJ8g3gxlhFkgHj6ZV4OwIUhg832a
         eY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720310054; x=1720914854;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TkBRl4JZWQbks3co99KOiKCP10Ez5zuclfcztvGtTA0=;
        b=cRk4auHWj3oxsuZOw7CTYhrlG+7SvkmtyBr/pI7GPsTo1f0qno+4L17C9ttQy3MikQ
         Ixh6bEM2ItTMbz/GmQB1ijW8TIJIOxH6XJbtmn5CYMDUBFXmygeOjxtrPJmmZ6V5yptR
         oQdHdI5iDPdVK/6LH/9B3niIhlZfs2hn/phqknqBsRzIpjUPBeY+W/sn+7oO8tRHjyEz
         yobfXaRrS71cMbbIWwpgnyIW3M0I6XWQsh83RZ/eUVMlRMrKIbjiLfgpPQCkk2VsfwkE
         5ljG0MIHC+cpBls6A6VWHu8H9HyPzIYvwRCf7ecu3mFAY+xY7ktmPM5OgqgCqJcY/kuv
         rcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWijb3N4apvM0MudJE73mfrIhkKtrLmz5doNWBbMWCm9Z7tXOo7CiRIU188H/Wy2MC8nqhukgTMdBiB+2Qhuz6hrylS1FnL41JI21fT
X-Gm-Message-State: AOJu0YwjMQBrb+AahIGYrjHBwMKctw3/yyqBuDEwivciSVj12OqUREie
	CVrIaxWbtYoeddOm34StTVj3y/SriLQxEN6V1Xd3Vc2hUJgFpHNNA+TYLg==
X-Google-Smtp-Source: AGHT+IFjxLRiqWs6I1gi7nEI+ki9QPaE28Ux4OPOSjqrc1XSsJ2GiZOGt6EoykKVzB28W+fz4rbdZA==
X-Received: by 2002:a05:6512:2f9:b0:52e:6ee4:5eaa with SMTP id 2adb3069b0e04-52ea06bb184mr4849434e87.54.1720310053762;
        Sat, 06 Jul 2024 16:54:13 -0700 (PDT)
Received: from [192.168.178.20] (dh207-40-28.xnet.hr. [88.207.40.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77e7a56e30sm71995566b.141.2024.07.06.16.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 16:54:13 -0700 (PDT)
Message-ID: <51a4022c-e5a7-48c2-8c87-0e26a1b7b406@gmail.com>
Date: Sun, 7 Jul 2024 01:54:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Felipe Balbi <me@felipebalbi.com>,
 Peter De Schrijver <peter.de-schrijver@nokia.com>
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: [PROBLEM linux-next] drivers/input/misc/twl4030-pwrbutton.c:33:
 warning: expecting prototype for twl4030().
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

This is the result of testing randconfig with KCONFIG_SEED=0xEE7AB52F in next-20240703 vanilla tree on
Ubuntu 22.04 LTS. GCC used is gcc (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0.

The particular warning is as follows:

drivers/input/misc/twl4030-pwrbutton.c:33: warning: expecting prototype for twl4030(). Prototype was for PWR_PWRON_IRQ() instead

The offending line was brought with the commit 68d8bf0436001.

 23 #include <linux/module.h>
 24 #include <linux/init.h>
 25 #include <linux/kernel.h>
 26 #include <linux/errno.h>
 27 #include <linux/input.h>
 28 #include <linux/interrupt.h>
 29 #include <linux/of.h>
 30 #include <linux/platform_device.h>
 31 #include <linux/mfd/twl.h>
 32 
 33 #define PWR_PWRON_IRQ (1 << 0)
 34 

This time I really cannot tell what is confusing the compiler (GCC 12.3.0).

As we know, warnings might be a sign that something is wrong which I cannot see, but you might.

Best regards,
Mirsad Todorovac

