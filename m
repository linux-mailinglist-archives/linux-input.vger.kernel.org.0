Return-Path: <linux-input+bounces-1069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126DE821577
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 22:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8936B281AC7
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 21:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622A1DF6E;
	Mon,  1 Jan 2024 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0c2aYV0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C2E542;
	Mon,  1 Jan 2024 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d3dee5f534so62287975ad.1;
        Mon, 01 Jan 2024 13:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704145640; x=1704750440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/APosVrVMXUnOCJEXHbySPguKRvlISTy2lVQz7JRLU=;
        b=O0c2aYV0hRxYJlB62k3/RxBQkKO/Nf0Lh7J0MXZ7h8Mjx9pOXhwPABjg1qaaeKezko
         Ubd4crq5t34zelNBVya0q4cd89NyZFKAaSrwjmcaJQKkB7IPTx87YnlL/PLt2n3RXiZh
         B32elD7tkiOGOhWewDNwoRwSWLfwk82N/cy0KRjiW/MPdpt90YPE/99COkXwLqw/RhyA
         BmfiR93hzxf9DONGSIiKJfO8rXsjg1nTO8T3QMcerHD+fmULtdZr6Tg0JFsaSpNsZdCf
         w6axCuMO7M6kpqx+9B8mDSlv26p9soH0iC+2b5I/k7kauzQpiNbg2JUEZKchploighRa
         ZoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704145640; x=1704750440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/APosVrVMXUnOCJEXHbySPguKRvlISTy2lVQz7JRLU=;
        b=j1FnKMHhJWkQO6W6DalffezLFcWHHsVKDfrsroxmBbFyvNVEpzhgiVH0WzuBib/7/V
         Z7SFO8rZAbmuv7M989yGO2b4IRMqPhu33IEq3eDc6LVvCdpvCAVbp/WOQeNZOqvjJmtm
         5i+a62c7muwt9v4KjWG1kI/dlUODJjiaFhy0h/KGu9EibIcKqMjJOQtKwoCQfEHTtMy7
         S2zPxvWVGv+jUe3+1Hc9dEQSP+VgPKQ3hGjqtCqmuXWPKjqKd/A/AkO2SKeaEK1G3ZZO
         M4lyxHiF+PJ/sTcwUn3iOwkIdHnVTv2ZB53ACYV7eldccYoU4J2QkERzd7GvNiEzqr0Z
         EGSQ==
X-Gm-Message-State: AOJu0YwKUpUotQ+g+0elXNgwjXmjGhoq9Kuypm2ssO223C8sEKqY/rGZ
	JzhepxYsoOHLGoUd3ZzAiIU=
X-Google-Smtp-Source: AGHT+IF6IBga4D7wqQkayDBJmBEBXK0W6YUoEaNegNC69eHdg4Xw1OJaU30HwH7mcfMoSSOSyjQUiQ==
X-Received: by 2002:a17:903:120e:b0:1d4:73e1:420 with SMTP id l14-20020a170903120e00b001d473e10420mr11492808plh.67.1704145639566;
        Mon, 01 Jan 2024 13:47:19 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d07b:b054:c492:5e6f])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902a70c00b001d4b16f39a4sm3152207plq.197.2024.01.01.13.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 13:47:19 -0800 (PST)
Date: Mon, 1 Jan 2024 13:47:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add support for slider gestures and OTP variants
Message-ID: <ZZMy5CgX-WFwnG2W@google.com>
References: <ZZMZzeX77VeHdIeL@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZMZzeX77VeHdIeL@nixie71>

On Mon, Jan 01, 2024 at 02:00:13PM -0600, Jeff LaBundy wrote:
> This series introduces support for some additional features offered by the
> Azoteq IQS269A capacitive touch controller.
> 
> Patches 1 and 2 add support for slider gestures (e.g. tap or swipe). Gestures
> are recognized by the hardware itself based on touch activity across the chan-
> nels associated with the slider. This feature is useful for lightweight systems
> that do not post-process absolute coordinates to determine gestures expressed
> by the user.
> 
> Gestures are presented to user space as keycodes. An example use-case is an
> array of multimedia keys as seen in the following demo:
> 
> https://youtu.be/k_vMRQiHLgA
> 
> Patches 3 and 4 add support for the device's available OTP variants, which
> trade features or exhibit errata that require workarounds.

Applied the lot, thank you.

-- 
Dmitry

