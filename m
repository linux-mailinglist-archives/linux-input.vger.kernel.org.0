Return-Path: <linux-input+bounces-3682-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EA8C31C0
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 16:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73B101C20B19
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 14:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173B25339D;
	Sat, 11 May 2024 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="j6cyjYav"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB66FC6;
	Sat, 11 May 2024 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715436620; cv=none; b=nyYu/4Mzi/Q7NFPulHFuUolQYaYHebjVyP//gyZWhxpYLrwTZjCDo1To3EAOd9FoiBM4Ng/FriW2zeGbKwlcdyNzP2yoG5FcQTGLDs1mcRlxqFDYGhniidseYLdE6osE5UjRes8B+ijBCSvPTttqFvIC7aHdTTI6IQ0zy49Xqi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715436620; c=relaxed/simple;
	bh=jECW67JfmZiMBxrkGH4agBSZVxmhlLrAoq+T6zEv7WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9Xy7RCVGi3xQZe2ktUw8taI0a1Y6QlIqyvuYVwUJ2+2xW0trdFuT434cjNA6+aUv5871lAOQunTSoEUaTpnxuS8/xZeW+8/c2sft7LFlUNvI8G1vEAuJ8O2UB4Tx+ucceRe54kda2xSbocc2cGE1G/5sLlLmaF4E8NFvJrmpgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=j6cyjYav; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C77CC005F;
	Sat, 11 May 2024 10:10:35 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1715436639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YkB7lTD5TwqOheDl5UhhEZ5s95fLONe3G1Q+9ddrNhI=;
	b=j6cyjYav5tpIesRKpl0/ZUmiuQpEvWQHLlD8Hkdh5ulpFDPk/nhjLu48feW+rCpXxZ/e82
	CH9zW9ye3RQ5WBNrLgxXwhmRoW0Bw0jEWuCBl7+oRTtosJqWFxxtZTb4o3w3TIyV1cLs0R
	gA33XEGTTm47kfJw/RxDBsEBxAw7cck=
Message-ID: <dab1dddd-57ae-445e-bce7-879e8d73d809@kaechele.ca>
Date: Sat, 11 May 2024 10:10:08 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: input: touchscreen: himax,hx83112b:
 add HX83100A
To: Conor Dooley <conor@kernel.org>
Cc: Job Noorman <job@noorman.info>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240511121245.109644-1-felix@kaechele.ca>
 <20240511121245.109644-2-felix@kaechele.ca>
 <20240511-passage-obstruct-70e4c3b37dbd@spud>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <20240511-passage-obstruct-70e4c3b37dbd@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2024-05-11 08:38, Conor Dooley wrote:
> On Sat, May 11, 2024 at 08:12:22AM -0400, Felix Kaechele wrote:
>> Add a compatible string for the Himax HX83100A touch controller.
>>
>> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
> 
> Commit message should mention what makes this device incompatible with
> the existing device.

Thanks!

I have added this note in the commit message which will be part of a v3, 
coming after I hopefully receive a few more comments on the other parts 
of this change:

The HX83100A presents touch events on its internal bus rather than 
offering a dedicated event register like the other chips in this family do.

Felix

