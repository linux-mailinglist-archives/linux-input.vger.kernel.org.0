Return-Path: <linux-input+bounces-13844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACCB1C88F
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 17:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4E95650B5
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 15:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3598128FFDA;
	Wed,  6 Aug 2025 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Gw1k75gR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB928F95E
	for <linux-input@vger.kernel.org>; Wed,  6 Aug 2025 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493637; cv=none; b=cbtfzGwT6Zi95JCqcvotXYgw3wiTr1UCo3J15uaV5tKAI3SRlC8M/TpvogvZ3fOY/u43V50XY480l6a5M6CWYQ0gbBIryaC5bfX6GZ7Pv0m5lDXdSmtwZrMFhGB/bARPdAXmeNfDbDNSWiTPjd0Jqycy0JPz7GJ1r4US3FpW1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493637; c=relaxed/simple;
	bh=THJ4mY6JP9KzINol5ozU48RD2OdXbU6gAFvUJe70Dtg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YnrBQ/ox56zvl4pXpxYsQZVGyhTzdJGll+MWl+22PgT8x0NSj5TNcWofkc8OOKPz8MRcJpJetqRWKnPNHasLzobxi9bfRJpMpraGcq5CkRDDuQ7Woy3hc0UJiS1oPMQoR5CDuK8HviNk6eCIboV4vC43NaLPMP8G5bKstc93yi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Gw1k75gR; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-af91a6b7a06so1232462466b.2
        for <linux-input@vger.kernel.org>; Wed, 06 Aug 2025 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754493633; x=1755098433; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Zzi1nGGRA6XzeMW1fYOZMZYBNySqK5zZKNEMrIG1tQ=;
        b=Gw1k75gRHdeOS4nYwMld9weI1h/fRv528ATi+0VeTQygCopcVpUzRD3YbZWV/MM5Kc
         axvmf9/IrkqDXgUE281bOM2dRociS+cdlxeSAr1f+pzd8YkRWxDMjIrU/15LSGcVpQ2l
         mDx3x6wUsrwwPY/lGMPZ5oWlaA/BPjKiKrTR+PJW/p3qTBCrxrYSSWVhV6w+8DgWl846
         5snG8TQwQam9sKzWxxeXWR3h1zs7BJ+nw0GUjutSWK6DcafCDF6bXwQ74gESJmBmIIed
         GoaeOp+lZTrQwMnEc4EsQ9Lg7EixKjrWjbJWnO8sbrQmhg83tZdv4guM0C6ECtvXaMeH
         tFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493633; x=1755098433;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Zzi1nGGRA6XzeMW1fYOZMZYBNySqK5zZKNEMrIG1tQ=;
        b=PvwAPv6OUS+4tbXr4FbwV/3iGaLbZ8RnjhQ7b8o3RsAKhlGwHXLE9h4VQiUV5YLuJ2
         c4ha2l1Lg4WkeIk4EvV/y8B5FFBSQFf60nOt9sxVc+sgOILazblcPv/NnvckUGuxYnk/
         uLvnLEIxhqkPukQztvKpP8gFR1GIiVCmBnB+1RNY6HviASQYKfzERSBig25e0gvUodVO
         3kJBEUbzRg9aVkMFMrPEd9xAaOjJV7GGbfzLvUAWVVisLP5ZQzHPoRin3eURdTSJjyJe
         wibqX8jZrBf+zAXyAhOfK5aN9wX9grpdtB0lOUBmYOCrzSl8ZQb9xzpRfW8SboLDzEeS
         9ymQ==
X-Gm-Message-State: AOJu0Yyt1qBrWLtrQ0xm6fJ5Nm7GGT+fPpG43WKdbXtnnGmwxlGDUxCc
	hSq47zSYcZah4t7W3nfr4xCFXqCRvmCG+c0pTMXwpSy5I8oZjnF8woHS4u4RnZlOK7E=
X-Gm-Gg: ASbGncvzQl348FPckURxa9LVMZbFahd8nMpTa1jX7agNsfTppSZEw5KA41p8upPUiqw
	hE3tQlWp+O+/AZaS1lyitn128nIysh707hNxD1HzscZJuLjC65gF5SCwiFVcZDRBxahv18xB/21
	DvjSd2e8d4TKMNoYcYYUy9sCIR6iQkc8VUKuNaUGwJhG+pMq44wJy8k6wk2TcgaSzHsPnsV6oiy
	2CrfP0KV39/1IksUwqz5nTNK5dDPVwFf5gX1YqgEkWweKLkYc3Fog7Pj+r56/cxvu+d3H16kMag
	eYbPqPjoIlUqdB+qxRGAo465Z+fNOa9HI0lti7TW0Lc1dRBRHBb5ds6kbNl4Yy1DBPESVI2Kvwn
	FW8wdj3TFO+fn/qlGg9X9u2fW71mQ6R5Ia14DPKynndARuqQNvZMAOpOGOFk6QjMuXEU=
X-Google-Smtp-Source: AGHT+IG3qV4kZGqVo4ZddiejaabwSclW0B+23L/UCpPE6bS90enQp5m3ugBwQEPInkFSiN2kcHunLA==
X-Received: by 2002:a17:906:c10b:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-af99034427amr353234866b.35.1754493633472;
        Wed, 06 Aug 2025 08:20:33 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm1118814066b.120.2025.08.06.08.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 17:20:32 +0200
Message-Id: <DBVG33X1DW3S.R29ELIG25SN3@fairphone.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Griffin
 Kroah-Hartman" <griffin.kroah@fairphone.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
 <20250806-aw86927-v1-3-23d8a6d0f2b2@fairphone.com>
 <581aaa8f-9e08-475e-ad23-3369fa05e53e@oss.qualcomm.com>
In-Reply-To: <581aaa8f-9e08-475e-ad23-3369fa05e53e@oss.qualcomm.com>

On Wed Aug 6, 2025 at 5:13 PM CEST, Konrad Dybcio wrote:
> On 8/6/25 5:10 PM, Griffin Kroah-Hartman wrote:
>> Add the required node for haptic playback (Awinic AW86927).
>>=20
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++=
++-
>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index 4c6cb4a644e2..9576efdf1e8d 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -866,7 +866,16 @@ ocp96011_sbu_mux: endpoint {
>>  		};
>>  	};
>> =20
>> -	/* AW86927FCR haptics @ 5a */
>> +	vibrator@5a {
>> +		compatible =3D "awinic,aw86927";
>
> I noticed the suffix is absent in the compatible - does it matter
> for discerning the particular chip and other variants?
> Anyway, so long as you and the bindings folks agree on it:

According to the datasheet, the main name is AW86927, while the part
number of this particular one is AW86927FCR.

I'm not aware of any other variants of the 86927 though. At least for
some audio chip from Awinic there seems to be different variants with
the same number with a different suffix that have a different amount of
pins, but I really don't know 100%.

https://www.awinic.com/en/search/all?titleSearch=3DAW86927

At least I don't find any non-FCR variants here.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


