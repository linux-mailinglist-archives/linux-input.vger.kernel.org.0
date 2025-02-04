Return-Path: <linux-input+bounces-9753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891EBA27407
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 15:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0924B1618F8
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 14:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BB720DD41;
	Tue,  4 Feb 2025 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9FUrakp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F020CCE1;
	Tue,  4 Feb 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738678026; cv=none; b=aaOIFqNh6fTHe0Xoo+crOnIUt42DM040U4FiglCTxuI6tBk7W516WNXZwuwKR75NoUjelmzHoLJ+NJBJ/p2dNbzt8m+3tiFuDPG/WAIjZn512sWBDcYV5nKz6oUZjtIjNCZlLyXEbJt8fYmpBEKsH9JH/k3hCiB3yCr8pEaCpc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738678026; c=relaxed/simple;
	bh=4BI+DC6jY8y3aAJHZLSeLXmWJS3mNlJZiK9IMjGeHRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4ThdPnc2Mo2ugp60PQ1u37EIdHJXEqr4xWcJAiIG5SfGpt8d8yTIZgCxAuZvvmzijc9CJHz0R4T6d/I2j8+wvazrqVwNWvUSAnwCJEspmL9eBHimj9nFLjA1oCO3ITqi2p/ekpn+tG0gPHiF5IAGVRwETLDJDeMBA0Gw0IzzH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9FUrakp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9cd8ecbceso757896a91.0;
        Tue, 04 Feb 2025 06:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738678024; x=1739282824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2SPRJXuyU6QCHO3x6z3SS5qSIxY3ygTODck+/ob2ogs=;
        b=Z9FUrakpevSMFGF5ftfMC3gG5Yq0Lq4Y154AB6bY/b80BLjWJSQCtAHmDRQCSmdrm2
         oVlOrejt76EhohYQ5a3nQDGyhv2ndGWW18noNrMAHa18qhNIlcOLl3xvcwYqe7Mk7qFo
         cnm6O0Gzra6tCdR978SXYTWoZPm1i2raZFHLFLbETuOGkKk6aGZJajd8vmOAeTuxLp7Q
         efAQSe2bMGoou7ruMuYRjowamDPBps6DMihkeiDXqoFOzMD2CUaHLXCCl3UxT4ZdXSk0
         gpM3eljHlLs9x0FL557QnCrqDzvrUreYnmP8fjiF8gxKP3gnLdlLs2mjR3zrBk6xq+KJ
         np5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678024; x=1739282824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SPRJXuyU6QCHO3x6z3SS5qSIxY3ygTODck+/ob2ogs=;
        b=sBROTYGdD6eH+Mv7gwCYnyhWlYdvxYBaw9LHqDheOsfsl4ck8flxxmV2cPkLP5VsDS
         IRRZT8dBKB1GQblKNpw5HpdXTMAIOCodgKJU2Zx3kQ8vpxwKXnMzZBD0hn1LmcORIRCf
         J8CjODVP70gL0TxxnQB4GYW2z/BzC9KmbQ9i9QyqR7gY5xXyrSJa1+9OUKED8qaQ4/0S
         JXd3guNSXraNC4oPlK/XxQz4owKCGhevP2KLCpz1EB7fM0evtujIfVaxTCOsBziR4DEY
         fosNCv6fl5SgnDE7vLzvxdYJ2r1mrtd2UAnSHkvcQQ5vS3sfZh2DlWlV6ko9UBZ2l1aR
         Pz4w==
X-Forwarded-Encrypted: i=1; AJvYcCUeOt2gjVlP5J7cVs0/fLOf4kRY2OjyXzZ2c65bXl7lNJvI2GmV1H1ywy79OkjfLUwdsvtC19adYfB/04Y=@vger.kernel.org, AJvYcCV/0ZnbwMYknXevFgcwbTjMBsavR5D1WsDqoXkHLrF0EA7zlPvrq3hXalcqSnb6qc1jjNiZP+wSODTs@vger.kernel.org, AJvYcCVFpvoAw9Aafu2Xc69PQb4Up8uR0eMTsoP8rko0phIAdUVgsS2cK+++6yorBSw1x+nLjF6uWnwXTviwIhTP@vger.kernel.org, AJvYcCXYbSfZr2kdQDkg1sWNKiG0jT4tuMv8KEO8hHga6JLl01floE2H7RpfmSfLyGkuXd4bT9PXSRtuvH43q7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2xESIZ3kt3LlBwMes9uut/Pf8tjLpFdx4cPVaPaGAI+KBog2
	Cpr7uUKhmfs0LrOj6pGSZdS68VX4DEYCv6efLXzzSASZG7hpTGl3
X-Gm-Gg: ASbGncsz3GUl8YzlldoRDRwQS89eUAXAD6sBGObH7/ENRX1YWS2OCYxGGnDNW1Yte1S
	4b22OsRnPx8oDFcg7yoE/JaL05l47/g/9Zpsi/xaZ3U2sdydWiNZHM0WMVs5rRT/GrzGYE4wchk
	PzDDNQnfZP4fKlM1pYd+oMXZa2+C3Y1T69HafyI/adpmvdQzwQWYmPzLxJKdbgqw2wNpJ6m/DhG
	DntyatXVthDheN9aYL3KUG9iRAgTtQ8HrLR+R/Rcy5udoATCs9RLc0vIQgHhJbsqJG6MQ0EJlTu
	6fUFaQ1sE9ZGZm/A
X-Google-Smtp-Source: AGHT+IHCEpNGTDSz9S/JHC8fHUAUklYlUP4RYeV7Tg+G/2HXvC35f4YlNXquW+XmxDi/fvQCrgVoEA==
X-Received: by 2002:a17:90a:708:b0:2f9:bfda:49b0 with SMTP id 98e67ed59e1d1-2f9bfda4a0cmr4062831a91.20.1738678024259;
        Tue, 04 Feb 2025 06:07:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:719e:1232:c38c:b1be])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f0750966fsm12895265ad.221.2025.02.04.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:07:03 -0800 (PST)
Date: Tue, 4 Feb 2025 06:07:01 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jens Reidel <adrian@travitia.xyz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
Message-ID: <Z6IfBXzb2hg7-lAW@google.com>
References: <20250203174309.21574-1-adrian@travitia.xyz>
 <20250203174309.21574-3-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203174309.21574-3-adrian@travitia.xyz>

Hi Jens,

On Mon, Feb 03, 2025 at 06:43:09PM +0100, Jens Reidel wrote:
>  
> -	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADDR,
> +	if (ic_data->ic_type == IC_TYPE_BERLIN_A)
> +		fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A;
> +	else
> +		fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR;
> +

Instead of branching on IC type please have goodix_berlin_ic_data
structure describe differences in the chips (by adding
fw_version_info_addr, ic_info_addr and other fields) and then simply use
them.

Thanks.

-- 
Dmitry

