Return-Path: <linux-input+bounces-11980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6AA9AB3B
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB5D0164691
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43494215771;
	Thu, 24 Apr 2025 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="KsQ/+kV1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB9C481DD;
	Thu, 24 Apr 2025 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492327; cv=none; b=SdIe+iGf4sQkkMw+foz0R0bMlSE10pw6tp3y2Y8/2TbAn4A3tCwHfgJ9rFlSD0Jxd9C3+cpetflUzlMzDY0d5xvyvTiIQQ72ng6sqYAlLnQarM3ASIeWRkmuCdxqhspDlnBZXLm9Y/pKy8vuuwlEGC3apJFNciWue7Xm/n9RYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492327; c=relaxed/simple;
	bh=pwzzcId2S5xkyfjScreHwyoOgGqqkLkL+qWVXWgHlaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jd2NGHrSYnO5WqQXkqcoKssTNH64SnD02fcTxfJl0Kvh1MBVduqIGISn9EZAPVrj388ELNzQ1CQ8FEFsSpKYdyboq75hnDScBewdXYZXaWsazQ2r5xTH3E/ULIcy76EPo5oMOualoa1S0Kwlf4qbE2MqkFZVOloNt0YlPRjjI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=KsQ/+kV1; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1B1352FC0048;
	Thu, 24 Apr 2025 12:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1745492321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5h6ihSn6o2mWzjaY00CpI+tb2U90HfwkB2Z9g/5vBc=;
	b=KsQ/+kV1Rn0hEPkPvv/ZEvULlPzoMUwGr0HbrEuA5kCkLosb1nhOxxmIOOB2QdZsouEmsc
	HhLy/bU+zdpMjok4u9tLoHFiLXkhRrigyG1uuG1WYV/wnYE7kNCyNzI+AUM99GosE6A2Xb
	dmRTQBlEtHXsduj5JbDc+hiB04c1ndQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <99d486e5-8836-4a83-ad05-8bc42d845cdd@tuxedocomputers.com>
Date: Thu, 24 Apr 2025 12:58:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Disable touchpad on firmware level while not in use
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250211133950.422232-1-wse@tuxedocomputers.com>
 <20250211133950.422232-2-wse@tuxedocomputers.com>
 <df09a3f9-6131-435a-ad68-4cea71237e42@tuxedocomputers.com>
 <9q411092-1170-qr2r-27or-96594p19qrqo@xreary.bet>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <9q411092-1170-qr2r-27or-96594p19qrqo@xreary.bet>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 24.04.25 um 11:20 schrieb Jiri Kosina:
> On Tue, 4 Mar 2025, Werner Sembach wrote:
>
>>> Using the new on_hid_hw_open and on_hid_hw_close functions to disable the
>>> touchpad on firmware level while not being in use.
>>>
>>> This safes some battery and triggers touchpad-disabled-leds hardwired to
>>> the touchpads firmware, that exist for example on some TongFang barebones.
>>>
>>> For a lengthy discussion with all the details see
>>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/558
>> Any comments if this is a good idea or not?
> Sorry for the delay.
np
>
> To me this looks like generally a good idea; Benjamin, any comments on the
> hid-mt part?
>
> BTW you'd need to adjust the Subject line of the patches to conform to the
> subsystem style (i.e. HID: core: ....)

sorry an oversight when rewriting the commit log from local testing branch to 
upstream ready

will do in v2 after Benjamins reply

Thanks for looking at this,

Werner

>
> Thanks,
>

