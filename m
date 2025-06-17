Return-Path: <linux-input+bounces-12919-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE93ADBF4C
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 04:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B03017355B
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 02:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0CE22AE7F;
	Tue, 17 Jun 2025 02:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="GzoClq65"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B119DF4F
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128210; cv=none; b=g/I9y+V1kzjIP1Eb14mCXPMsXB4pm+BJYhiCw524MMqDQVV69ficBxxrrh4fixBUrXtvF5UOrkZz3y/zzrg4AFl4gEKUm/6/QuS6653/ph8roSy9cfTVMTpUJDDl088uIb+DBpFP6Jz8ewmks0RzIavQIB5Ugvq6D2RA3I4AVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128210; c=relaxed/simple;
	bh=oUqwUkWBDgi0mc2gJTlB6xDj3ptNx+s8sqxLF5rxveo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FHMJvUbQZszGYlVRJXzG8oOFFuyk6irYVmVOk+/JpbXDHm2BgK4IlXUkZ7qbtZNNdgVyvqgSiwkRMKbLZ+k5SyZBRJpYjPZMWd+CDa6OWkaFVLzQcjwoVQ1eSMeHChJwqRVpnRU1cN1xNOn3jjSkFlu9xgKZFyKY2loRBx0YkoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=GzoClq65; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1750127680; bh=oUqwUkWBDgi0mc2gJTlB6xDj3ptNx+s8sqxLF5rxveo=;
	h=Date:To:From:Subject:From;
	b=GzoClq65aQEkAIXCgUy8nM+Ucfch0yKS/vAN+IpmEfz4QD76A2OoP9yr7R7vco7Bo
	 TDdC2uCt8nrMYHHE7PSShlQG408wEyLMb/fyyGyfqNdcWRVNyoB8iD0awLHO1AhSkM
	 bz0Caw07G1vnB6MJHmYWtCD/KfD7aFo6x4us6aN2HBt684AEhjPTnAEzKT47ucDHPD
	 QKa/jS/cM3rQuv4FQ5/RHjq7Y/xE3rf5fp6vsiuIssXYlg03QmsHMMEvHij3DM/psH
	 wDtkcR4ZFo96doT3a6h4BYTsPCc+BCA6Pa12H5ByC/i6poyRG8Rq3FnV9OsaGVQKU/
	 jX5QF0jwUajmw==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 5876EA022;
	Mon, 16 Jun 2025 19:34:40 -0700 (PDT)
Message-ID: <d04aee95-df86-4863-bd54-b9d7957199c7@endrift.com>
Date: Mon, 16 Jun 2025 19:34:39 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>, bentiss@kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
From: Vicki Pfau <vi@endrift.com>
Subject: Adding more ABS axes and BTN spaces to evdev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I've recently been doing some bringup work on some flight stick and racing wheel controllers and have run into a few issues with how to expose it to userspace that I'm not sure the best way to solve.

For flight sticks, the protocol I'm working with allows for up to 64 buttons on top of a set few, as well as up to 16 axes. There doesn't appear to be good spaces within within either ABS or BTN for these. Though I don't know any devices that use that many, I am worried about the space for axes especially. Though I can probably fit a few after ABS_MISC, but really not that many.

More directly important, though, is the racing wheel controllers. The protocol specifies four types of axes and one thing that would fit fairly well as an axis: accelerator, brake, clutch, handbrake, and shifter. It looks like Windows treats the shifter as a series of buttons, one for each location on the shifter, but that's a little less desirable than using an axis for it in my opinion. Regardless, there's no good place to map clutch and handbrake. For clutch, at least, I would assume the best approach would actually be to add a new axis: ABS_CLUTCH, perhaps at 0x1d. Would this be a good idea? And if so, would adding ABS_SHIFTER and/or ABS_HANDBRAKE at 0x1e/0x1f also make sense? Barring that, I can use a few ABS_MISC axes, but that is perhaps suboptimal for conveying intent to userspace programs.

I looked around other devices in the kernel to try to figure out what prior art there was for this stuff, without much luck. I saw ABS_RUDDER in use in a few places, but it wasn't quite clear to me what that's being used for without the devices in question. I'm also not clear on what the HID driver does for things like this.

How should I start moving forwards with this?

Thanks,
Vicki

