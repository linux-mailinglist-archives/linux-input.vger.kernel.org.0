Return-Path: <linux-input+bounces-3776-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4478CC5AA
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F95280FF9
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 17:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4461422D8;
	Wed, 22 May 2024 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1ujy0Td"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804271422D5;
	Wed, 22 May 2024 17:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399409; cv=none; b=EciEEEZqUTZRn/pOx+xS4R3oyv+pv5m6AYUTo6dW2CsvTcevoKYhI4m8IyyDgQ7zNbYUukzipyiAqK7ehGV9wiknRwZ2bhiVBDeb3NJLCmoIv4hE+f+2lhQwozdktBgUs7reBgdEktwCGMQtQwTQS+AuhhyVTprEx8DmUc+e0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399409; c=relaxed/simple;
	bh=kHs/4kU405VjhDSNa3WEvfNp1Y/EzIXMaxFG/F0RHjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulg+6957pNb3/j7gHYo4jst2AcIVgfjI42ydrU4LllYnC+hMx8YppOLvWfMt05H+4/UxSMqKRRoWRNfZBjNff7Fl/dPN5BKojy0VJDJwRUlY17dfnj/qS4wCpKTmaDzvooxIN8/TNDKOu6d4J+csWAgmQoXpMxGJXmcxj6VM+u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1ujy0Td; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ed0abbf706so46343785ad.2;
        Wed, 22 May 2024 10:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716399408; x=1717004208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SuO5f2lfNj3wdDHwalQdiTvlvRcJtM7Mq66cYPidvlE=;
        b=R1ujy0TdgqQqNlTzvzmfuH435UF4osGlqzxKqpC2gMFKv1vYcE8TIrRsDLaiRKHMDL
         bHDNzRF1skNw2hXFAONOrIbga1PEZGcXw3pGLAQrz/g0NdJQ/6v6aqqW0ELnAo7wIbMn
         Z0vqihd1bTBPE1+NpNx+ytz6ZRu1VMUJTKYA55mlCH6FJEPPy2FRZbgEwdFIB4fjvlZW
         J5rI/6P+iL94vrVKihX8ykU4RRveBEyoKuSNw5CS5UWIrV2xMUTlA5T7f63eOm7O/iqk
         PEc/Gf35OKvt7KhJiizg/9yAZnFoMdkacMSKhREbq6mI0dqIog9aD4krdc3FO1ix0bbw
         hIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399408; x=1717004208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuO5f2lfNj3wdDHwalQdiTvlvRcJtM7Mq66cYPidvlE=;
        b=Jz4C5Oli9NF3LSE4V3mYiIPZ5nQUgEsAoQLvGTEVV3sYlS0BFwnRxB7TKHa1pEvhjG
         L4IAwpCOVo3NfaQM5xqO/YwHv3xHrpZKg92dr+uJNP26RvV9Vid6LmJNEHk/R53C5Qgg
         nfvokCs2L5Cj8dABxKjirz3TQwJ3hZVjzGPswt6xibuf7eJFbqHjfIUylqjwFP+fT/Ru
         1RcfOiQf8ehEoJalQrWs22Yx+20rtYCP5H3nJXizUWpCKf91lKlb71NCp/25+Jdx4MX0
         L/PbNajCRRDfDtOGYLsG7h/5D7N5SsGZMLYf8wwTaAmtKsHM37MBOAbvWtWMXgPmW3qj
         Odig==
X-Forwarded-Encrypted: i=1; AJvYcCX6PKB0p9s1b707Dr3zWJNEWOBxlYZThLhxqUZcPrjDWSriV/Vhd29+2V5FEmeH3GTCNdvGTJqaHtQoRZq/gaOgbi7Hfs05fv5FrkbOZ37VglFqgSUQeDOGS7wjMcUX8JLXXnI2a1BYVbk56WlFQ4S2MuOAOkiCtMm0Xuho6fEp1f/o1GTY
X-Gm-Message-State: AOJu0YzxZeGQ3/Fxf7ucfB2j42/9kugttdNqFcUl0kNXh8Ji9sXVc1ya
	j1D/86NZi4A6huQNab2sjfY29FybDoxT5rL+7JFmqrGO+4ryVVkR
X-Google-Smtp-Source: AGHT+IE41QasU866xHMfG6WT/qm34mRFCe4sORUQXLJne8a444oGyD+HPD0Kci0FiovrcLjS3gBOpA==
X-Received: by 2002:a17:902:d50c:b0:1f3:326a:5a5e with SMTP id d9443c01a7336-1f3326a5d01mr12405345ad.43.1716399407707;
        Wed, 22 May 2024 10:36:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d9d8:1fc1:6a1c:984b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c1388ebsm241590765ad.247.2024.05.22.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:36:47 -0700 (PDT)
Date: Wed, 22 May 2024 10:36:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: joelselvaraj.oss@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06:
 Document FT5452 and FT8719 support
Message-ID: <Zk4tLPn277Azd4XZ@google.com>
References: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-0-2a648ac7176b@gmail.com>
 <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-1-2a648ac7176b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-add-support-ft5452-and-ft8719-touchscreen-v1-1-2a648ac7176b@gmail.com>

On Tue, May 21, 2024 at 09:02:57AM -0500, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Document FocalTech FT5452 and FT8719 support by adding their compatibles.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Applied, thank you.

-- 
Dmitry

