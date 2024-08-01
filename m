Return-Path: <linux-input+bounces-5272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E368944EAA
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 17:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC9C31F22339
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 15:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C181EB3D;
	Thu,  1 Aug 2024 15:01:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC11370
	for <linux-input@vger.kernel.org>; Thu,  1 Aug 2024 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524484; cv=none; b=G+Y+TVJxzulYC8BPS36ARxS32En1EBwrfOrkvIB3ud7vV59jcYVBfj846v/q6u0ofoZ51EncmREYbpnaxt7VE33GU1vPOFyA0OifdykhYmxcB31zDnLC6ufNXia3VxhztOUxUKK6fVZuh/DIusNTixuBWMMKukIUJABaZCHaHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524484; c=relaxed/simple;
	bh=xDYQRz2zfjaC/TVAVz2YenfZxGKnilXGn5SX3/e0M3w=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=WayN4qqSMeK47da24ogUUpRRRss/08PE6BBHGNlo8cXuy4M6Dpkt8v8t9dpru1V2TTOPadF+6O4ZFlLdadcljahef53O2BRjlLhQjs99AJIVSKz4k13jbvOpqCq16cHRPFA5aMnQuIKUbZd9r+NvoQ0d+GiO5pY13kaBy8pmrCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id EC1CE61E5FE01;
	Thu,  1 Aug 2024 17:00:53 +0200 (CEST)
Message-ID: <b326259a-e971-4fc4-987b-e3e106a938d8@molgen.mpg.de>
Date: Thu, 1 Aug 2024 17:00:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Dell XPS 13 9370: Linux warns `i2c_hid_acpi i2c-ELAN24EE:00:
 i2c_hid_get_input: IRQ triggered but there's no data`
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


On the Dell XPS 13 9370/0F6P3V, BIOS 1.21.0 07/06/2022, Debian’s Linux 
6.9.12 warns:

     i2c_hid_acpi i2c-ELAN24EE:00: i2c_hid_get_input: IRQ triggered but 
there's no data

What can be done about this warning? Looking at commit 1475af255e18 
(HID: i2c-hid: Ignore input report if there's no data present on Elan 
touchpanels), printing the warning is intentional for all ELAN human 
input devices.

> While using Elan touchpads, the message floods:
> [  136.138487] i2c_hid i2c-DELL08D6:00: i2c_hid_get_input: incomplete report (14/65535)
> 
> Though the message flood is annoying, the device it self works without
> any issue. I suspect that the device in question takes too much time to
> pull the IRQ back to high after I2C host has done reading its data.
> 
> Since the host receives all useful data, let's ignore the input report
> when there's no data.

`include/linux/kern_levels.h` defines:

     #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
     #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant 
condition */

As the condition seems normal, and there is no hint, what the user can 
do about the warning, like to contact ELAN, I’d reduce the log level?


Kind regards,

Paul


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1475af255e18f35dc46f8a7acc18354c73d45149

