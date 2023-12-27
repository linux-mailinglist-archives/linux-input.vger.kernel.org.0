Return-Path: <linux-input+bounces-1032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA5281EF79
	for <lists+linux-input@lfdr.de>; Wed, 27 Dec 2023 15:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD94828293F
	for <lists+linux-input@lfdr.de>; Wed, 27 Dec 2023 14:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AEA45969;
	Wed, 27 Dec 2023 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fW2QWVSl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9A45959
	for <linux-input@vger.kernel.org>; Wed, 27 Dec 2023 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5554f268c6cso735469a12.1
        for <linux-input@vger.kernel.org>; Wed, 27 Dec 2023 06:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703687762; x=1704292562; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wR0fA2efkJESrqqJYNa2oQGAt/YmCKg3TrlURKizJ00=;
        b=fW2QWVSlSNLZwDTVrc5/lullVMXvChtN70fFK9aEFyE7WTKMHsI8TeuPTzR+YgEErr
         j5w9Gb2iGUDo/DPvqUdW2jd3RalrOfyXZuakf3yfWsbTSRbOFyRpP24CBEM0JItRsiPN
         rca2c2+sixXnX/5nyXjWDxs0H6kIu7YQhtdva7RFBSC7s0s9BO03QlXqv6NJIBX4a+0l
         Z2vpTaR0lEM+ZTKQvcoWLt0FVXaBT7l+rdJmfF3R9K4WPWXwYenW3VORkS6T2HRZnNIy
         k0uw8RMgJOx7dvWju4A8X/IFbqfG5BRLqw13TVjW6koU5XyImzGnqzsFxlSZWqfs5gsB
         qeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703687762; x=1704292562;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR0fA2efkJESrqqJYNa2oQGAt/YmCKg3TrlURKizJ00=;
        b=UbGDdaigfp/dFQP0LDtckEqtKB0fxOmOKoDqg2FX1wFey7h0OCkb5t/x5i0DmmoToB
         +brdGFZ4UnXGH/uSHxjd6HeYIiYKZsvtVfwUqiubWHyihJtLaqTUl16XCSF31+8+iioM
         bRw4CiZxpp8x1dS5/4/taHKlWxd9PihLfQwsENNvgSlVYmnhb3rPdediMYHbSpQl6uiK
         pxfVFhmnJVvL+cLBPFLvRDpd5HYekKrjDGK4CassW3ANvbJ++QYWX9p1PrlhkQrJCh3A
         8hZhKqh59cbfN3zLEK7Stf8wBx5819fFib7Orn/HbDo6HNgSKEhL+LAlRfw3AowlnWk/
         GxfA==
X-Gm-Message-State: AOJu0YyQUxtRa5uwT53ysq/RBw5hP+rT4nLuuQWasK6o/GOkjTKZ/iWg
	sEF+o6KXlIFmAqwy1ydfTbm2r6tT1dRyKQ==
X-Google-Smtp-Source: AGHT+IE9Q5JNB6Xn8MbtzTVI7wKdq/jzC7JpsJwbZ89E2w9tZ9KE/hSvKM4257pTwBaIWTef/FR9OQ==
X-Received: by 2002:a50:c2c2:0:b0:555:56bc:c966 with SMTP id u2-20020a50c2c2000000b0055556bcc966mr438593edf.22.1703687761964;
        Wed, 27 Dec 2023 06:36:01 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id fe1-20020a056402390100b005544105f461sm7399656edb.29.2023.12.27.06.36.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Dec 2023 06:36:01 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 27 Dec 2023 15:36:02 +0100 (CET)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>, 
    linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, 
    robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
    benjamin.tissoires@redhat.com, linus.walleij@linaro.org, 
    dianders@chromium.org
Subject: Re: [PATCH v3 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Ilitek
 ili2901
In-Reply-To: <e304aec7-5835-4f4f-89cb-bc3e1dfb78d4@linaro.org>
Message-ID: <nycvar.YFH.7.76.2312271535440.24250@cbobk.fhfr.pm>
References: <20231227085013.1317-1-xiazhengqiao@huaqin.corp-partner.google.com> <20231227085013.1317-2-xiazhengqiao@huaqin.corp-partner.google.com> <e304aec7-5835-4f4f-89cb-bc3e1dfb78d4@linaro.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Dec 2023, Krzysztof Kozlowski wrote:

> > The Ilitek ili2901 touch screen chip same as Elan eKTH6915 controller
> > has a reset gpio. The difference is that they have different
> > post_power_delay_ms and post_gpio_reset_on_delay_ms.
> > Ilitek ili2901 also uses 3.3V power supply.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks. I will take it together with the HID patch through my tree, if 
that's fine with you.

-- 
Jiri Kosina
SUSE Labs


