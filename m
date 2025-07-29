Return-Path: <linux-input+bounces-13713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3BBB14A80
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 10:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A92E3BE85E
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D02A285C95;
	Tue, 29 Jul 2025 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b="C78ofi88";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="GCO8EvsC";
	dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="qkH4Tsbq"
X-Original-To: linux-input@vger.kernel.org
Received: from sender7.mail.selcloud.ru (sender7.mail.selcloud.ru [5.8.75.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142B263F40;
	Tue, 29 Jul 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.8.75.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753779248; cv=none; b=enwJawLf11OJcfsYnL92KZP0NGDTBJ6lUWY3rAAjvUIHRwXBLwZb5VZqf7BsnGzCXBsWZZAUlesa5cAbykTnjeCM/e7eDFfc7HXsum4gv9QgBJFJi/kdMcBAl0YIylQg2RpPxUNHSJyjBRKxfNWaZEuhvV2NZagfsmH9HBLRtlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753779248; c=relaxed/simple;
	bh=xHRF5ck/dSCKkvBdHGfIYaKerUtm2ifkBDGuilUXhnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eESEGwke8Jf9sk9ZgpZ+zxw2UweG2gpjqH5AhXsEetRatAy0W3PnnuiBtJjZrJGMzOXYCG1xyVunWrBf57UL3xTJ68uOA+KgJIYHN4PqERyMVeFG1pbMw23JKWwJf6Dz0veA8D8K7+B6wMhU12zFlfD7QsUBpL8FswGVPgHPYzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=mail.selcloud.ru; dkim=pass (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b=C78ofi88; dkim=pass (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=GCO8EvsC; dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=qkH4Tsbq; arc=none smtp.client-ip=5.8.75.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.selcloud.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.selcloud.ru; s=selcloud; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	List-id:List-Unsubscribe:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Help:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PfA/Mzgm/emmBtrQ2XU6azYHY0aYh/fqXsSaSjV/xRk=; t=1753779245; x=1753952045;
	 b=C78ofi88/AXW8nbhCUCysdHp7XJMKFK2PY2KVLIVddjT+KRPcwPO1R6FT+Koi2Zk566OACXjDq
	Sbc4qXdCr9lLTKvn21kUVl1fqo/TuUvml79mgL0qPmyq1yi2ous6bP7aKh1zahqZr/vRfC0eZspvX
	SbnBFUnLf21FidLQreGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=foxido.dev;
	 s=selcloud; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:List-id:
	List-Unsubscribe:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PfA/Mzgm/emmBtrQ2XU6azYHY0aYh/fqXsSaSjV/xRk=; t=1753779245; x=1753952045;
	 b=GCO8EvsCEE/ZDPfZrkXQ3Y1QmxqE/8VNnYRHTufdlq4tnFmH15BAp7OnvvbLJcpmWSiCHr6pUZ
	crhAZUU4DKqm6OsMiy7oVvAcZZo6mJEjQslKNV1B50RDFZ5xo3pUVcJ+jYBMzvrh+KXLxbp4o3dvI
	paXXcNWTXe+YPOQYOYy0=;
Precedence: bulk
X-Issuen: 1118611
X-User: 99111435
X-Postmaster-Msgtype: 3849
Feedback-ID: 1118611:15965:3849:samotpravil
X-From: foxido.dev
X-from-id: 15965
X-MSG-TYPE: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-blist-id: 3849
X-Gungo: 20250728.224157
X-SMTPUID: mlgnr61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxido.dev; s=dkim;
	t=1753778277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PfA/Mzgm/emmBtrQ2XU6azYHY0aYh/fqXsSaSjV/xRk=;
	b=qkH4Tsbq/b3H1Wjt9J5GBw5CBlOwxbxkdL/+ZyzCzfoNxmqcFGYQCFLZ7pBKmILEp8Dzd1
	8DT4BW26R1ZhZAvbK3+YFfQNo4OKoLmAgaFsKlBz/m14xzC8qb+4RlwU+P6NsJXELj5AbI
	HeEvgAEehPSDMENZoOkVxa4bH7GG/wwG9qm5g0rXYYjCk9l59rCVyvcc8IvaOmXVrkdU51
	25R4u/H8PkLh5JAj+hBuD/fStS4hJINx314V5qYUeu/CCWADgXQvTMTyxv1n/3WmXiQOEw
	gz0Ogrrb9bBotio8NcKtbIkYzFwtc1/p78gZtVjAaPpraOs9IanhU2XZYoLHEw==
Message-ID: <b9a06c17-c18d-4ff1-b020-9eea505a6f41@foxido.dev>
Date: Tue, 29 Jul 2025 11:37:47 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Add WMI driver for Redmibook keyboard.
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Nikita Krasnov <nikita.nikita.krasnov@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>
References: <20250727223516.29244-1-foxido@foxido.dev>
 <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>
Content-Language: en-US
From: Gladyshev Ilya <foxido@foxido.dev>
In-Reply-To: <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/29/25 00:47, Armin Wolf wrote:
> Am 28.07.25 um 00:34 schrieb Gladyshev Ilya:
> 
>> This driver implements support for various Fn keys (like Cut) and Xiaomi
>> specific AI button.
> 
> Interesting, i was just talking with another person about implementing a 
> WMI event
> driver for the exact same WMI event device. I CCed the person involved 
> in the discussion
> so that he can test this driver on his device as well.
> All in all the driver looks promising, but there are still things that 
> need to be improved
> before we can include this driver in the mainline kernel. For details 
> see below.
Thanks for your feedback, will fix in v2. However, I have small 
question: do I still need a mutex for linearizability if I implement 
driver via sparse-keymap? I've copied mutex from xiaomi-wmi, but as I 
looked up not all WMI keyboard drivers use it (fujitsu-laptop, acer-wmi).

--
Gladyshev Ilya

