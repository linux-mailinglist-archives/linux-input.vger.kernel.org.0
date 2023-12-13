Return-Path: <linux-input+bounces-740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B103810982
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 06:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D59FB20CBE
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 05:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FC2C8D5;
	Wed, 13 Dec 2023 05:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7NNE5w2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A222D5;
	Tue, 12 Dec 2023 21:42:57 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28ae217726fso347625a91.0;
        Tue, 12 Dec 2023 21:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702446177; x=1703050977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlKaj3UwdiivARNyL/svpreXNxfvojoXsKXI4pfhnyo=;
        b=O7NNE5w2Ii95+7Mm2R9T2gZq6TA9Y4Vb5iOFFwYp25PEy8KPzlLuQbOYlcq6RmnY+A
         pWvWQLWXEoJ2QOTJT19MYKNQOOgszzhtyjg3nyD9//p2dDT4oHpy3K9G6aMpQiAcz2fP
         SF00YZtHyTHRUS2pcdYJO8LrOrW0N7P188Y8DTzCmzabE5T7xOuRyACsxvfIdTX0TPGC
         h81K+4QhwsZBGrGiN8JOpmK+SlLijUnOZEY9S/53ERtLZIvxdgvuuPMuOidihrXS6BVt
         Mse9uvySO8ZZG0qpgVzYo4Qc+rBx1g2qxwS9dS5reX5UpCg02YPrRP+QY+T9TjvCsUYl
         ejgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702446177; x=1703050977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlKaj3UwdiivARNyL/svpreXNxfvojoXsKXI4pfhnyo=;
        b=FMY7DP367nvwRHq3TjfCMK6HNMQ0enijPjpEfzEfn0UWeBUdqZAypY+9/OoagvXQWN
         VHohZ8d53RyHAJiKy0r7uEy54TyxDY+Kr1qVX8NGklRGQqlIZIpp1djv4M2Xvq9T1eRz
         0S5wzKTxExhPvQjayYTD86KoFg9MhE0J/TFw9d2FzYNp0KqQXniZ5vNe+SGG+wXqYKna
         1s0WlL1GGsfaTYAHXi7k1VD56V+A9DqB6i1g4Teqyn58ND6F95js5KGkTSDZa/zexAaH
         NT0EruhqxnwO1VbeuySBD/25RX7NINC0D3/64nEBo8ea0Y1w4OzkdoUgQt1GNVrmVg54
         ZnlA==
X-Gm-Message-State: AOJu0YzWJW92zkEwKzxgdrYQ1/IuPA2AJoYX9/VYDo8Qgdw14wUbXnQK
	/ydofHjNJyEasMgjXSgKlf2CU57z7EZgYw==
X-Google-Smtp-Source: AGHT+IHmZh3KOhV16fQ/mKYbNj5lYmddAySg4ZKDHWlxTuMqfr1vxBx7mhqH/CJQlRunnUTIudH/Hg==
X-Received: by 2002:a17:90b:e8f:b0:286:6cc0:caec with SMTP id fv15-20020a17090b0e8f00b002866cc0caecmr5709845pjb.99.1702446176728;
        Tue, 12 Dec 2023 21:42:56 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id b10-20020a17090a9bca00b0028abe58ff9bsm2427232pjw.40.2023.12.12.21.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 21:42:56 -0800 (PST)
Date: Tue, 12 Dec 2023 21:42:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] Input: max77693-haptic - add device-tree compatible
 strings
Message-ID: <ZXlEXcLw5O_i1O37@google.com>
References: <CGME20231006100330eucas1p2c874f582336ed1de4dc1cd759c452ce2@eucas1p2.samsung.com>
 <20231006100320.2908210-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006100320.2908210-1-m.szyprowski@samsung.com>

On Fri, Oct 06, 2023 at 12:03:20PM +0200, Marek Szyprowski wrote:
> Add the needed device-tree compatible strings to the MAX77693 haptic
> driver, so it can be automatically loaded when compiled as a kernel
> module and given device-tree contains separate (i.e. 'motor-driver') node
> under the main PMIC node. When device is instantiated from device-tree,
> the driver data cannot be read via platform_get_device_id(), so get
> device type from the parent MFD device instead, what works for both
> cases.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thank you.

-- 
Dmitry

