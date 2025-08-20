Return-Path: <linux-input+bounces-14203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081CB2E4B1
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 20:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 745E816C8CE
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 18:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1284C26F2BC;
	Wed, 20 Aug 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b="vN7BqWPk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="Ayfww1fJ";
	dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="mWPhf268";
	dkim=permerror (0-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="R3yaKArO"
X-Original-To: linux-input@vger.kernel.org
Received: from sender5.mail.selcloud.ru (sender5.mail.selcloud.ru [5.8.75.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BC224B01;
	Wed, 20 Aug 2025 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.8.75.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755713416; cv=none; b=ujzHmbS/uMkSVZ2b7rHOiMmyoiNU8dcScT/r9XzSIgo/CVnobdg3EFAYoyrYtYN4pCH7XTJEY6ZgK769uDilJnzYAa09JIaGOcRvvFvuz0flDtFSIQz16xujqxUNifyx76xs7uYArh0wJcKh+lm9Br7ArHzv2ntiOE3MccY6+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755713416; c=relaxed/simple;
	bh=Ayu8NTMNqrACA/xWxZ9Oto1UwmA+ZaYxsWy+CYL2YA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEiV+WUkwbdYBO4DZNVFERNMSOsh9FTUKl3xkZB5/CaFgO/8eXFc/v/9sK73iqyGUIjsblFN/Nokr7o8jzU54S1nQF4feDQGDipluDi2gxkAFKZMsDbsjAbD2g+XA//xpnDKwuI9JMG4PF4HR5M77q/hPHDx0j7470Hjr8MqmKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=mail.selcloud.ru; dkim=pass (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b=vN7BqWPk; dkim=pass (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=Ayfww1fJ; dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=mWPhf268; dkim=permerror (0-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=R3yaKArO; arc=none smtp.client-ip=5.8.75.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.selcloud.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.selcloud.ru; s=selcloud; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	List-id:List-Unsubscribe:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Help:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3rZCFHEhQF0ILx7kruo0lq1GV94urTRbu8oNzrO/itA=; t=1755713412; x=1755886212;
	 b=vN7BqWPkD7ep4x3/xblLyMnENV3CkeC4cpsKJvhDylcg9WcTmQTUHiIn3o60RVtlPXpb8Y1Iwq
	UMRGq+fXdX4c+TOHLjmv4vXzd6FReaMXz/hcY96THKPEZ+TYk8mlljriaCMBLKGv6DZDou16LeQSX
	1+o6zw6MzL3wIn/hHoYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=foxido.dev;
	 s=selcloud; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:List-id:
	List-Unsubscribe:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3rZCFHEhQF0ILx7kruo0lq1GV94urTRbu8oNzrO/itA=; t=1755713412; x=1755886212;
	 b=Ayfww1fJA+DNW2vBCsvN6bFEKkwccegpLUtbgtZq0sFhxsVfGBiww7Dlygrzym+YKzS1QUy8s6
	FKeXXeLzFEtX7W1vdYyp/NJ33oBouQWTV7QFcU0fOV1NIA2rhcbU50EiKVwrD8mv2PDwdUxhIHJ8h
	e60+rl/t2I4EUN0CTfbo=;
Precedence: bulk
X-Issuen: 1147648
X-User: 95634118
X-Postmaster-Msgtype: 3849
Feedback-ID: 1147648:15965:3849:samotpravil
X-From: foxido.dev
X-from-id: 15965
X-MSG-TYPE: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-blist-id: 3849
X-Gungo: 20250819.223726
X-SMTPUID: mlgnr59
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=foxido.dev; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1755713403; bh=3rZCFHEhQF0ILx7kruo0lq1
	GV94urTRbu8oNzrO/itA=; b=mWPhf268VPlZpOVGoiDw3VtPsHbUM2SGHmfaCeprlLIIa4jMlC
	XZwM8WYTSmnuXMexEkozbkD+MjRXdTi6iHYxeTyarPbg45qvZzhtoshb2MIvSWa4wJfGAY8We7p
	FU78ygzrJVwLbLI2zeS+T27F4J4ISFHZc1g3OcqRfRRvrYMc7HDidvtuX2YRqUwNdvgcMR6PmkF
	LiuKpc5++2czqCLV7pz63b7bpMg3Oi7cIT2rwBCyj8nRectoZgcslL41gywxyltXYO9n9pYnrkn
	nuVGUDHXptvXCMG8abGRuro7Z5EbZKidKEn0w7SVkwWAkkNuogpbd77WCo1Sr3+0jBg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=foxido.dev; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1755713403; bh=3rZCFHEhQF0ILx7kruo0lq1
	GV94urTRbu8oNzrO/itA=; b=R3yaKArOaOKR9WsEbmWJVz16engZrPoYQgfJN7STA3LzPvQu6/
	SQoXLa/59svznPBb5HxxOW2tAUn7TIScFAAA==;
Message-ID: <42588e0f-b510-42e0-b4d4-e1e8860d90a2@foxido.dev>
Date: Wed, 20 Aug 2025 21:10:03 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: Add WMI driver for Redmibook keyboard.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <w_armin@gmx.de>, linux-input@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <20250813153137.18355-1-foxido@foxido.dev>
 <0ed8cf19-09cc-52cd-bc55-bf3f5d9e0c33@linux.intel.com>
Content-Language: en-US
From: Gladyshev Ilya <foxido@foxido.dev>
In-Reply-To: <0ed8cf19-09cc-52cd-bc55-bf3f5d9e0c33@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[resend because I forgot to Cc mailing list... sorry]


On 8/19/25 13:22, Ilpo Järvinen wrote:
 >> +
 >> +    payload = get_unaligned_le32(obj->buffer.pointer);
 >> +    struct key_entry *entry = 
sparse_keymap_entry_from_scancode(data->input_dev, payload);
 >
 > Please only define variables at the beginning of some block (in this 
case,
 > at the beginning of the function).
 >
 > The only exception to this rule are cleanup.h related variables which may
 > have to be defined mid-function to ensure the correct teardown order of
 > the auto variables.

Oh, sorry, was blinded by a same mistake on another line in a hurry... 
Fixed in v6 [1].

By the way, shouldn't it be some checkpatch.pl warning in the ideal 
world? Just sounds like a "why not" task to do in my spare time, so I'd 
like to clarify in advance)

[1] -- 
https://lore.kernel.org/platform-driver-x86/20250820174140.41410-1-foxido@foxido.dev/

-- 
Gladyshev Ilya

