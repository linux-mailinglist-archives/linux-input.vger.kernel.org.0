Return-Path: <linux-input+bounces-16491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB010CAEF6F
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 06:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CD7F303E64C
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 05:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C3230C359;
	Tue,  9 Dec 2025 05:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvltD9wf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E18A30ACEE
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765259041; cv=none; b=GHFQd/pCognZ9bFZVf6TDbQyRDpptCfE/LfYuMbVO2dkR3e93EqRvsqCo78JYp9jhA6a6LZSqHgZeCOAbNcR/ugpXpU0bQIzPYj8GfGVlYuTdhmr1/B0lK3/py7iQ35ijl1BTBNuNL4PM25J9YHq7Zn6WCvlh1vwriMZ1MXLl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765259041; c=relaxed/simple;
	bh=ewZGnGr4ELFmuKy7ur8hsCPFVQvvRKGYASdymZkBr8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+6415WJcTZeQfBdlPcVjiauLljvyGY5WBZVLpJpybQcWJzP9Z3qjJrd8c9TuJbJ/KzidKIHHd4PVAkGIleSYyW2LSNJUJn/dNRy5ZIUFUvyYV+AKPp97JHc+MuUlLyE01Ow9+HZqYUeCQC0SjCycSNzKw+iyryjaR5Yt6dyPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvltD9wf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2956d816c10so60726835ad.1
        for <linux-input@vger.kernel.org>; Mon, 08 Dec 2025 21:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765259036; x=1765863836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bww2fGKvTw9ApTK4GXrI4Dxq6GYtZpQbKsfGIOEYogE=;
        b=GvltD9wfUgzklLk4ds8D+vVBVUOysovPrfKZssr3Famz7g5UePocY7CKCjT1DtRqlv
         BzYFWP705wNSnhWECi2TyRhZ9IY+muZndQ2scdIlAz73w103LQVl2XkQ+sHHxT7EtMvz
         HIAXaMIABgPX/l6Z0fkSsaObmBaSk+3dAFf4iCl1HO3lbrmovGUIDBpP8iAYmggqFScC
         A+xs7x/qDJHarX94o+PXD2QsG7b3zEY0/7Sj6YTZjbbTYazmdZN4GxlYE9Y/PK/yvq4n
         j6ce5qG8UHHaZo/u6UpQ/X1g5IxSGzxQ6S2J4QZc373vVDPzk0tfyDlQ0wVcBeFZGqWV
         5Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765259036; x=1765863836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bww2fGKvTw9ApTK4GXrI4Dxq6GYtZpQbKsfGIOEYogE=;
        b=sxbNzvoEgNWoNkfmmUYc2fQfT6wzeLiJkdO3x0nI6Rm9DsHzf/VJoJLTM/xdoNJvSK
         DyYJNlnJeAIW2UrWKPTbRpu0QNQlCAal5uyMVZ6kxtKvkzNsLwx3n+8CLbX1xEvwrPWK
         SW1OLF767GoQQb+LPLw5Yh2OpV2yV+YxQybVmDbibDfuW3omRBfEyTIsK/rdShRdjOu+
         orCrMfQN0MIhUTSIh21YDGJKmDc+L8eg0aC5NOnVNChQRrreHFr8Sl6Ek7u4ND16ITA0
         8nEAw3Qsv8osoxOzHqPQ/92i3Et8Ov/IqB1qb25+9DqZmNfLNMoz1TEhJ80zk8efWfDg
         6fsg==
X-Gm-Message-State: AOJu0YxhFHvcsJmy0tnTkGejZWjJ4YfCMdh6VUpFSL9lD/gv5P+36VQ3
	rjmaonWLoJ1dy7MrRp8aJLNC26/W5DFUno3+PfEwbUIWokd0W33EXb28
X-Gm-Gg: ASbGncvBeLvjBFl5wb72hBq411NAf1v1g/1CM+czQU63oXe6HHtWRDQddyunrH+Zslu
	p0BoQvJXZDB2h+OFlG7R3W9sAg7rm6kG7MNoPoENfp1mFcRJMzFh0OPGeiKDyfNzuKbYaL2fbW2
	35QoMspYBnw9ZOFugqSUtguRnZpEZjxDtOvKMtJ+1IymPVcd0y7cuZaDsFGORhID3kNz1iPlhA0
	UeD20a89Q6rkYtscmM0ixl2WKR3wmlGItLafOQJ7R21M1guLHBuddKPDUhuLAfYK4ad/OllVEN5
	ohSxRE4xdD6VCtjhzHflIA6WRaJClFykQNAqdZZ24m0XyyHgDjSVPogO2M/CwJ8jYMpuP/MXvpI
	ZzSaSc/GRk1qfQXsMP0n6ej4e2y/33uEvIXKPUlneanbKjZTIaI9CbkUlwcm6eKdCqutXiyfori
	jC4aGr6RKFZSbt9qSOoeB3NRKBw6IsiFUcqIIWTu4gEonjtvOYlxFK
X-Google-Smtp-Source: AGHT+IGao3Dwwbqkn4PUfdLNRiPFFRYOcPbHK35ci74crEsx9lcOayWI/Np73Q90bT17XyE9PVaz2A==
X-Received: by 2002:a05:7022:521:b0:119:e56c:18a1 with SMTP id a92af1059eb24-11e03168624mr7044336c88.9.1765259036196;
        Mon, 08 Dec 2025 21:43:56 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:bf2e:ccbe:6eae:cfa7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df749f8ddsm44830312c88.0.2025.12.08.21.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 21:43:55 -0800 (PST)
Date: Mon, 8 Dec 2025 21:43:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] input: byd: use %*ph for Z packet dump
Message-ID: <h6uhwg5hoa3j3t5rza6tldfqqdxx2wkn4pdwrqz6pt5uy4zbtg@rclulqglh5j5>
References: <20251202033120.2264474-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202033120.2264474-1-vivek.balachandhar@gmail.com>

On Tue, Dec 02, 2025 at 03:31:20AM +0000, Vivek BalachandharTN wrote:
> Replace the hand-rolled %02x formatting of the Z packet warning in the
> BYD driver with the %*ph format specifier. %*ph is the preferred helper
> for printing a buffer in hexadecimal and makes the logging clearer and
> more consistent.
> 
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>

Applied, thank you.

-- 
Dmitry

