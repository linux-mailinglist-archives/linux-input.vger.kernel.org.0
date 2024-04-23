Return-Path: <linux-input+bounces-3184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7BE8AE5D9
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 14:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC96FB24578
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 12:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875E7D3E3;
	Tue, 23 Apr 2024 12:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1tTpSCD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213257BB0C
	for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874709; cv=none; b=U4E8w8VB+oXEvj6k0A0qrIhkzeVr+Vym0YrHumjxVknNYX53VqmFaRAJKaWrH6MK5BSb3wUHIQKoeDrr+Y5MdANLfr2xspwY/7zQSQ3PtfAp6rZ0MKfOLGBQohZVUCFCD+MhEk7EU20nxIEqjdomDQTI71Aq+kRPADI0vQXFhxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874709; c=relaxed/simple;
	bh=Vzdpw2/uEznuSfdQMFfhde2Y0dHZrz/Y0tK/HgOsKHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQVrhqE4hgAsnup0XiHXnquTNSw3QTqCI3DHXq9XmoOcscJ0XR5WSmJ8ut9EIKvOvRrPNCTyJ/SWfgurpXc0/iSywtstXIK/gC0Xn2HnlwLc5WLzlZA/9XU/EkjFxMJocNKezkVS/xhwdtgmHa0hY3CQDqo35kybNrj1/mIAHRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1tTpSCD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41adf3580dbso307435e9.0
        for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713874705; x=1714479505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qovlPvm+dXAcLyyeUhuunG1IdfbZgObOR6Q+gFrPnAI=;
        b=T1tTpSCDZ7n1dooCZf+cM3WdkrWy/YnAeHHOX0Phu9pJ53w3eSaAhUhsmU54WJHb64
         /UUn4s4xnEXzKFOB9Q3bsrcb0yaIH7OS4RfyFUgN5pgudva+AXZyxdGCO1zh44x1DmOs
         IGGmHVSwzvLoii2ryBqE8/57HI8bLXx5GFjFvdkw0LeBuVvtvxW39QfwbKW5bZ85XyrX
         YN82W5loM59bumK9uMOrUhdH+2szM7np+JGrWBFLm+MWxNIyIt+mo126TMhht589/sCk
         AmzENDLfkL+hGuwdW/ew3VaMWbz1jkm2YsWvETuJXqlv0mr9PhjFQ9xIV5Aj4aiBMSoS
         hogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713874705; x=1714479505;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qovlPvm+dXAcLyyeUhuunG1IdfbZgObOR6Q+gFrPnAI=;
        b=GFiyReV0HbSskvKAQTCLCwwBBYxiU+tW8tq/MIf33Fq5FzjOfZ5JE8hZFgyNB1nZYQ
         4Mbc8zZ8WWYvFRfyU/P6EGZaOIGcenbHp5/+wotlTKDBIGn4/GqD1nmWuf8Dxnz7+oyR
         BhOWvOV/xpggPhpUMWTLIqTz5os4JXPYCkJ945oiJ/YfgJyo0gnekjvJ0NX66nLHp+i3
         bXUrBHv77Uo8sXvaU9N6lNBlgSrw2A9x7FvPJK7mflEqo1n/t09VwaZ2mUcwqqOZa+Pn
         U4MNgT5MC4NAqs9Atw3hn3Oa6d5u64U4gZI7XKYuQXP9y+exCo4vM4SGBNzppCL2N7Dl
         ikQg==
X-Gm-Message-State: AOJu0YyAPthyU1ugzaXcIxdEx74r5jfD5wEr4g3xKFrZ+B7RfOxnfpBw
	Y+IJC4qFNxPyFmWTKlcAiuEGiKZVEaPG3pUect9pOMzXDxIXa3f2wTiEZ7io/Lw=
X-Google-Smtp-Source: AGHT+IGAgnjdaHAl8g9ADJ2jkebw1eWUOpqoPI58UOiJLtKgVfUXANOzLb2tjQjwERzuHX13N4uqEw==
X-Received: by 2002:a05:600c:450d:b0:41a:410b:fe9e with SMTP id t13-20020a05600c450d00b0041a410bfe9emr1940596wmo.12.1713874705465;
        Tue, 23 Apr 2024 05:18:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id j2-20020a05600c1c0200b0041ac3e13f1esm1597319wms.37.2024.04.23.05.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:18:25 -0700 (PDT)
Message-ID: <f2021c5d-25fa-4bdf-8f8c-b0bc271eb54e@linaro.org>
Date: Tue, 23 Apr 2024 14:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616
 compatible
To: Andre Przywara <andre.przywara@arm.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 James McGregor <jamcgregor@protonmail.com>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
 <20240422164511.2488261-2-andre.przywara@arm.com>
 <20240423111502.6e068887@donnerap.manchester.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240423111502.6e068887@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2024 12:15, Andre Przywara wrote:
> On Mon, 22 Apr 2024 17:45:10 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
> Hi,
> 
>> From: James McGregor <jamcgregor@protonmail.com>
>>
>> The Allwinner H616 SoC has an LRADC which is compatible with the
>> versions in existing SoCs.
>> Add a compatible string for H616, with the R329 fallback. This is the
>> same as the D1, so put them into an enum.
>>
>> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Compared the descriptions in the manual between the R392 and the H616, they
> look the same:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Why do you review your own patches? Does it mean that you contribute
code which you did not review before?

This is odd process.

Your Review is implied by sending the patch. And you have there SoB
which indicates you sent it...

Best regards,
Krzysztof


