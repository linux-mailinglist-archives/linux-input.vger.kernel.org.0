Return-Path: <linux-input+bounces-202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D457F4495
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 12:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED761C20A18
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 11:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41CE26292;
	Wed, 22 Nov 2023 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99BCD8;
	Wed, 22 Nov 2023 03:02:34 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b34e7c829fso39853439f.2;
        Wed, 22 Nov 2023 03:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700650954; x=1701255754;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eiBSC2kAnOrbX9wM+8OFXkbvY1npbxoCVLQe1hYRSgs=;
        b=U24o8WImB9xwnOi7UfhTCvNIlXGMlNwhA6dBEI6MKteaNxESmGSw1gebmO6wYsg3MT
         9PdENuqDkumHsOS2Jx0/B7UUxKfVqn6vmYiE9/5MruYrzSR5eIRE6mp08XLmZlt7FS9T
         njd1TmyQ32NUCtIwROQ4Ub4vOAqYXtP3xdQQi9dOzpsOw9cs04Pa8EBbxgxjp6q6vFgR
         zj2QOj28/5TOY1LLr37KWJgCBHRpwp3HbBonYv9xlox2wRAOTA6VlvgM4h+HNsnWZGyS
         jnX4w9DN/GFFXg4SuhE0iYpBA+07taazmFSqKurKueMs+N9xYdD27rzC/BtnvsSKDpyC
         y8Lw==
X-Gm-Message-State: AOJu0YxnR1WYpid+nqw9tlZHt0Qc8/gruWgk/bCFJ3RGuhBrdErpQf1R
	gjvVhquWfu401Fi9YobgNQ==
X-Google-Smtp-Source: AGHT+IHd2RAZI4ut8gHQIsru4fuNJzM6M50xt76LRGT0qAPUuxj2gou5lr1wf2egkMC+53awGlvBxQ==
X-Received: by 2002:a05:6602:370e:b0:792:6963:df30 with SMTP id bh14-20020a056602370e00b007926963df30mr2060536iob.0.1700650954135;
        Wed, 22 Nov 2023 03:02:34 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id ge23-20020a056638681700b0043978165d54sm3177120jab.104.2023.11.22.03.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:02:33 -0800 (PST)
Received: (nullmailer pid 116324 invoked by uid 1000);
	Wed, 22 Nov 2023 11:02:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org
In-Reply-To: <20231122-ep93xx-v5-22-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-22-d59a76d5df29@maquefel.me>
Message-Id: <170065094261.116114.9958175828656550459.robh@kernel.org>
Subject: Re: [PATCH v5 22/39] dt-bindings: input: Add Cirrus EP93xx keypad
Date: Wed, 22 Nov 2023 04:02:29 -0700


On Wed, 22 Nov 2023 12:00:00 +0300, Nikita Shubin wrote:
> Add YAML bindings for ep93xx SoC keypad.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  .../bindings/input/cirrus,ep9307-keypad.yaml       | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2m.example.dts:24:18: fatal error: dt-bindings/soc/cirrus,ep9301-syscon.h: No such file or directory
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/dma/cirrus,ep9301-dma-m2m.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231122-ep93xx-v5-22-d59a76d5df29@maquefel.me

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


