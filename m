Return-Path: <linux-input+bounces-351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ABB7FE1B0
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 22:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 421A5282516
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 21:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BED361682;
	Wed, 29 Nov 2023 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk0EPNKi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905BBD5C;
	Wed, 29 Nov 2023 13:19:54 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cde14ff73bso238117b3a.0;
        Wed, 29 Nov 2023 13:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701292794; x=1701897594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KW3qQ8h9EXtzt7iAkG2nS2wVN583eyZ43N0TK7zpzhM=;
        b=hk0EPNKidzrDZOZrsL/0US//ElAajxvuqvYTvilWBaHAYa+/Tt2PhOImse65QO0y/S
         +XjE2QjAC6/tmJQlk7K+57MDMLwb/XJWCq6qDbdGhB43c7TDvvuzjEUqi/DeoMddsjo2
         rX058iC4/MM5KAO9EfFVhIkN/ZIhozI9oXrrTWm5uhEWafp0hckyVRv9jwtIeKjw6f4l
         RtMgHqJLDtkydZ661cMTT6VyqPhvBrP9j9EyhvtnBJhRY5MMQfpwdufLrR5FJmwC2ql1
         FKtGOZVPtV7tiCl3rH8wARtivR/vwUeafhbdsceBQKiPCU9BkEOhPgGNXL+0TClt9UFG
         vvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701292794; x=1701897594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW3qQ8h9EXtzt7iAkG2nS2wVN583eyZ43N0TK7zpzhM=;
        b=bk7qpDwGEZ7Hen0CZI1FXiFJR4NVyJkErhijHIPMNNXxn5sW8xrHli11SGv4n5di8V
         xud8KvnrRF5RWiovpAMqhjYjNJ8noKFdntTsTErAgxvrlXskbf/vf7Ci7COz7Y49bNkY
         RWJs0wLfshhRRpLwOidOu42YEb2mjxnSdJT1vp8rt5dIFhR3NXGecp+FLxcG+LF8Y4L+
         cmKloXTAhgFCRiXY93jeawXI2pIyQOesk21fPsdJbo4v/OFs6tq1EI/qFiZmT/9/VP6O
         +al/Lmup/vpHs1N0iyy2CN8nMetBXSW+0n62uH1e4yMHdmWuKgUGmPBO8qVE2BX5F2xS
         EI/Q==
X-Gm-Message-State: AOJu0YxvpMyFaPtZR9X3gwZAUtWvOlgaSjBZcNAUbfX7KSf4DpMVe/Rh
	6ZocUQyUSGOq8uB1tuv+6QM=
X-Google-Smtp-Source: AGHT+IEiDMmHQ86rxBXUyaqdI7JCOYktLhmvXO/W//0ZBzsmZLdAYVlg+44naXl5SmXDoOvxVC8LRg==
X-Received: by 2002:a05:6a00:1d88:b0:6cb:db40:4568 with SMTP id z8-20020a056a001d8800b006cbdb404568mr23386515pfw.17.1701292793733;
        Wed, 29 Nov 2023 13:19:53 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:64f2:7004:43e0:6095])
        by smtp.gmail.com with ESMTPSA id j7-20020aa78007000000b006900cb919b8sm10994904pfi.53.2023.11.29.13.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:19:53 -0800 (PST)
Date: Wed, 29 Nov 2023 13:19:50 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: sprd,sc27xx-vibrator: Drop
 incomplete example
Message-ID: <ZWeq9t079PWmzfGF@google.com>
References: <20231128214809.3975719-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128214809.3975719-1-robh@kernel.org>

On Tue, Nov 28, 2023 at 03:48:09PM -0600, Rob Herring wrote:
> The example for the Spreadtrum SC27xx PMIC vibrator is incomplete as the
> binding is the full PMIC, not just the sub-functions. It is preferred
> for MFD examples to be complete in the top-level MFD device binding
> rather than piecemeal in each sub-function binding.
> 
> This also fixes an undocumented (by schema) compatible warning for
> "sprd,sc2731".
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

