Return-Path: <linux-input+bounces-14103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F0DB2AE37
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 18:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 967F24E21C4
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CCC3376BA;
	Mon, 18 Aug 2025 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vpg2dF9h"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A2B232395;
	Mon, 18 Aug 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755534687; cv=none; b=A2DQzkSQol+bNUH6fmly/BpgMDyliaYNXEii8bcUOmLG4Br6AoBkSN/S1SKt47mPiVGjFtrF1a+6VnVR3wQZhko0vYDjUuAl4zbKigy2Yjf9TAW1uB/MMveLSVOSFWbwuQVuoVeXotfs/0zPn4yzl/4hlpn1XcAQDF7OF/Va+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755534687; c=relaxed/simple;
	bh=bLc0nZibL07470QPx8Td7t971WtRm0DvoFkI1T/bNGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRDFjtknKZAz5mPZxS/BsjwisfN3weCbK24FKinQzEupGUknTogpEug5C8WWltCf+pn48KF4P1uYmvBj51wsF8ZQKIxsaKgTlrFaqaIMufQjrJgW8W7JIfXp/friBBYwtKRx6GOZKcnYyadjarzedf+Jv0RDZZBpvCS7r56xZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vpg2dF9h; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZydZ5aWQQt0Ki31DOWs/xkOTwX4rKFTISgYNg01tGJo=; b=vpg2dF9hWmjy2BnhCRT8Jp4fcW
	fZxfcqJEO2BWjo+tiA9gqltSR6g71PdJqZIqovSGv5rWBu3N+5TEwy5A5HU3B6WHJVINFBP8lZiIz
	D0kgcoOB3tC6fj0xd18bJbtB6+lheqCTKhwJ9KzriwJqtofw6/XMLdEEqNhlSWneZXlnLX/eFzd1C
	c4D3Tp7QyTf5FGGTRvm0HnOKj9KIBzOmmxzy2Xb0L/FU8/9hM9BbBYOJ1jXVG9Cz4nKTUQDnqE6Ts
	aGTcdCv8nmsK2YOda7yz/e7/ngrAaVy8WLWNtDW8wkzfpwxpqNbAjCOFIWTzGFYVCJdqBP7cDuxS/
	Ujv3g9xg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2lX-0000000822h-3PN8;
	Mon, 18 Aug 2025 16:31:23 +0000
Message-ID: <e508ebb0-809f-4245-81c7-98e8de6ffdaa@infradead.org>
Date: Mon, 18 Aug 2025 09:31:22 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
 <20250818-support-forcepads-v2-3-ca2546e319d5@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250818-support-forcepads-v2-3-ca2546e319d5@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/25 7:28 AM, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
> 
> INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
> haptic capabilities.
> 
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  Documentation/input/event-codes.rst    | 14 ++++++++++++++
>  include/uapi/linux/input-event-codes.h |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index b4557462edd7b3fef9e9cd6c2c3cb2d05bb531ab..6f7aa9e8207c4aa825d9694ad891f4d105fe8196 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -400,6 +400,20 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
>  All other axes retain their meaning. A device must not mix
>  regular directional axes and accelerometer axes on the same event node.
>  
> +INPUT_PROP_HAPTIC_TOUCHPAD
> +--------------------------
> +
> +The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
> +- supports simple haptic auto and manual triggering
> +- can differentiate between at least 5 fingers
> +- uses correct resolution for the X/Y (units and value)
> +- report correct force per touch, and correct units for them (newtons or grams)

     reports

> +- follows the MT protocol type B
> +
> +Summing up, such devices follow the MS spec for input devices in


-- 
~Randy


