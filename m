Return-Path: <linux-input+bounces-3086-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E18A6B48
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 14:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CECA1C20D24
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 12:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8AF12BF2A;
	Tue, 16 Apr 2024 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEEv3x+l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFD474437
	for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271160; cv=none; b=IcqZz986bTi2KISnuGZ00R9mZGn4X0cPTDB0H7S+gu0zCWDZ2umUpPnkBiEBPol4z1y7fTgh4QNMFL9D2Rl2RgEDu3cZnfi5iR3Gc8blFpwUHvQgHDY4AQkQ32WDemu++JubJ1cGnw636u/CXW3FRtiRP3R7aVLmpNabxpF91no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271160; c=relaxed/simple;
	bh=INkgGkw3lfof6ttOSzX5lzwufaDoB7uPeJ1nhpgVeBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCdahUw57PjJ5B8lzaiODLfnYeRXSea49mUbYrYkzwMBmYZFms5ZW0jdTkF/eqPw9O0GloaxCUsTB2LVX4rhMymT9SKjpNxVQypTTgG4E7Y+2q1j2E8XKHssIYQEWWd2uEVFsZc1KMgvQqyifMwF3h7UOVGRxQ7B75TRRVr/Ptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEEv3x+l; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so3638600276.3
        for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713271156; x=1713875956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L5+AVlKX0UKLNpDnTXG4nLDmpjGwbimLrrB82xXakLA=;
        b=OEEv3x+lS4XGYlyWSp1K2umbJiSxK1HR5BAJqWRb7JWbFXnppyecl/uUENSFWXMFbq
         qLXMKHxWIhle0EEqFiC+cQCOR/X9NRJq8ly1QR11M34bmL2MyXLLDpkIHlQv+qdPQVAn
         F+tt/AVs/OsgJTdbkBGI865zapaZjRQkignR+Xql8iIhYqY5+d+yrpV2HKQIYE39r1ra
         kvTgR+QdZOZAAf+D2Ez8dvPKGXSV3NrqiPPOT8PXchYEWEF+deYJJNl6iov52XIVjTee
         GEghGjHAztoO8k1qhjzk5BJhxH1knZry+GUDSAqPGRS7f1bY3vVt7Wsyj1hFgp7O61CS
         xAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271156; x=1713875956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5+AVlKX0UKLNpDnTXG4nLDmpjGwbimLrrB82xXakLA=;
        b=tJ0nOJ3JdBREve9rgPJkr207G4iYrMGED3XVrYPQAwT9zDXOFlorn2lLniSaNKb7pM
         7Idc1TVN3H+SHJx69oBUt4Wx75MyGLR7VAiTj8XzunxnDCzNZt2Z6JYqilgRhf/TbVdw
         PRZco1LzLBjLXAbYAm3Pmn4OYagh1GLr4UZK/uukLURKxwpHxtgh7hIEoFVFeE8WrqjS
         aZtZuGcBFt5X43aUwQgwCJgkqxRPIAJGAbi7r2o+RuCRE6AfHdSZM8LwqOhMx7J8REqI
         znKYw+8uyMDHJlfQHOB33bHMUDXv9Gp9iVOOmQiPtT4HdlDhwXWyANMOz+kWOexkyqgT
         Znvw==
X-Forwarded-Encrypted: i=1; AJvYcCVtunJzDvkRru25IRGubeK5Y5q2ArDBocXEOyxuzm2feYWtYIznXPKdm+YI/3q8IYX/9T1yOYJsy6+d/43XRtPN7VCjZr7sgmOOMMU=
X-Gm-Message-State: AOJu0YzjdtC5cIqJfIZimr3Wkhcp6cMU2PoComqLPJZL3aW+gzk7ntbs
	vwY4n5ffxiplO9Ldn6hfH1+l593t4YLOqW7WXokvqeqd4F7JWHz+RxmzdqPeAdeag1DA1nPdFcR
	ni+Nu+HKplCzIeWPHhktlFPdI4XD660YzS+yN6Q==
X-Google-Smtp-Source: AGHT+IEwQ0Ngh3qKjVVX87FYrtRCF4iosRKAkJdiG4FLgPF1wzvvHbh6c2T/y9yAEHN+DSCC8BOhOKXji/M+uyanmTc=
X-Received: by 2002:a25:dc92:0:b0:dc2:2041:fc49 with SMTP id
 y140-20020a25dc92000000b00dc22041fc49mr12430917ybe.5.1713271156421; Tue, 16
 Apr 2024 05:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com>
 <20240416-pm8xxx-vibrator-new-design-v11-3-7b1c951e1515@quicinc.com>
In-Reply-To: <20240416-pm8xxx-vibrator-new-design-v11-3-7b1c951e1515@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 15:39:05 +0300
Message-ID: <CAA8EJpp9Td4ttqQN-hU72bEcRxMk0Wug92cTjvOKxfCaJb0Smw@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] input: pm8xxx-vibrator: add new SPMI vibrator support
To: quic_fenglinw@quicinc.com
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 05:44, Fenglin Wu via B4 Relay
<devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
>
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>
> Add support for a new SPMI vibrator module which is very similar
> to the vibrator module inside PM8916 but has a finer drive voltage
> step and different output voltage range, its drive level control
> is expanded across 2 registers. The vibrator module can be found
> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 52 +++++++++++++++++++++++++++++-------
>  1 file changed, 43 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

