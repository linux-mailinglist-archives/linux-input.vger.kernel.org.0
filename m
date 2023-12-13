Return-Path: <linux-input+bounces-752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0FA810B29
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83A3B281B84
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3951799E;
	Wed, 13 Dec 2023 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6BiValk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE37EF2
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:13:34 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ce94f62806so3655868b3a.1
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451614; x=1703056414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mki5rPMAu3WUykxOtSJv9e0vL6WvNDMbHnfwzLBDlOo=;
        b=O6BiValkhzMIPDFiKhyX84zgoxF1RMuV3j1RdjMr+AAcu+TFp0GZYxIKM4XSEesTzf
         nXlvAyPtYNRwRxWsOYEQ24D8oOpivwkMmGV563HJE+WABqgbV6b7ovP5PKVWQPnb91jp
         oeG5SLlov+ghNS1It9itwCHggZttU9UBDs2YsNJzSs4LWZOjahtZWSTCmG28iNIx3rPK
         sT+WWFQkPIgw8F64I6R+IZpGBbT/Z62zW7V0tJ50vFliVe4IecScJxdiVdHXzO2q1IAx
         o8DwDaLdLc5jQT+YsxDeAp9a65BKubrCQnczaWE/zSVZOVK3Y2TNytr8W5WfcYnviTtK
         oHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451614; x=1703056414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mki5rPMAu3WUykxOtSJv9e0vL6WvNDMbHnfwzLBDlOo=;
        b=Tu14K+1ovD8crtPSXJyrmh3wCLlwr9vnDVR54NSWa7s/QrlmaNe0fBsbwkpM32wSg5
         D3Q6+Sk4EXIajMmlNWN/fLkcLdswXtcx/1IlvMh9awMa+sXUbKm9vgF3LwKjM/kEe/qO
         zPTZRL04ympsGnPB/D/IFTU9UYo3WgvQiBdnMix/io+vYLshI7eB4CR66eVdJaXXBU1j
         djABK/T/eEGjUTKfI7CJadcuG+B4SdCvtAI1xaU+YBje9n4F8CSD1GKmUUlcbcDdyCkV
         2FcGPKmFq8ylnXWmtxZgqjdfQZAkvUDfp0uLhGxbtmHWeGG1wgFdO8xSxnJN20YXDkpl
         REmA==
X-Gm-Message-State: AOJu0Yx2TM5FUVBRHE0e/K5b8qntBkhsRTAbOyyGRkC98R587YkvUJqQ
	b8FMm+bVvTZqbKWnndjgFe4=
X-Google-Smtp-Source: AGHT+IHSGJYgPrI+XV1y4TMk8j7E6RnNa0I1PNrkqHf29umJ++2KQLXqgRCA1Y9wL19tnUFbvp+aKw==
X-Received: by 2002:a05:6a00:2356:b0:6ce:81f0:a690 with SMTP id j22-20020a056a00235600b006ce81f0a690mr3573871pfj.65.1702451614218;
        Tue, 12 Dec 2023 23:13:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id fa24-20020a056a002d1800b006be0fb89ac2sm9227016pfb.197.2023.12.12.23.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:13:33 -0800 (PST)
Date: Tue, 12 Dec 2023 23:13:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: tca6416-keypad - Drop unused include
Message-ID: <ZXlZm2qN9mo6US4d@google.com>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
 <20231129-descriptors-input-v1-2-9433162914a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-input-v1-2-9433162914a3@linaro.org>

On Wed, Nov 29, 2023 at 02:51:46PM +0100, Linus Walleij wrote:
> The TCA6416 keypad driver is including the legacy GPIO
> header <linux/gpio.h> for no reason, it is not using any
> of its symbols. Drop the header.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry

