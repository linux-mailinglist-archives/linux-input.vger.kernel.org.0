Return-Path: <linux-input+bounces-754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41C810B3B
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F140B20F02
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E3B17754;
	Wed, 13 Dec 2023 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY+TJdQf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3648D4B;
	Tue, 12 Dec 2023 23:14:28 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5e176babd4eso23797907b3.2;
        Tue, 12 Dec 2023 23:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451668; x=1703056468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4lQ/n2/Aooh3HLrGXdGkcUlpQ+xQAxZM0f/fJu9eb8=;
        b=lY+TJdQf8e7CJYW2MpDVB7jOjPt4v45zvtXqpctdwmQhY0FKrp2nGgcpY42njiiQDy
         UFXge8o9Jcw7NDnLm+zAtQDWg2b1mNXk7xmioBo6/+YLa1RmdnO6hubTbq+mBhimLR6b
         74kiChPu5mZJk3OEMQA40W5wW4kb7bH5BNVJO/8W7kslTnbSjwbuNmrnAPZKVU7ETUk9
         XZ48l3o0JN+aK7evHkA72PirOU3JjiNO+5JeRciX03i0V4xgRll0S+fNRKSNJ5do3UkE
         9BtsZuiRmQMpUgdc7Z5oAwIp49kRYiH7axCp1yHmB9y//pmR5JqzzcgItDMtknWtvEwv
         y8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451668; x=1703056468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4lQ/n2/Aooh3HLrGXdGkcUlpQ+xQAxZM0f/fJu9eb8=;
        b=eGiyyIzDXqPlSRL3AZcew8fSblMeuJGAyJIhKV2YE/j13ePvEtSgvXhSTvKXHsUbVN
         GezOCc3YjXWL12fnjlax4HIN0iJv5LDJO63/HO5izL1OjnQeQn6fg7RW/of4dty2bsFi
         rNJ4uC4MGgE/YELXAkAZ40oh50X7psjdfUt0YQq4NL7TZb/g/P1sO0m3v2vg41j68+b8
         /HhRdirohaOzb826AL+cnneVaU7R5gr5d+je2LsewYMn/sPUtVI58z5khmqyVx1j/ZF8
         aDnP4KhicVqn1i9TmYMQUDXSaU6abGk41uDDsRldkU48l9VKzxeMpmQqqypZIokyspCL
         XoKA==
X-Gm-Message-State: AOJu0Yw4GALO3Mz9ZCDRkWamzANXxl/z691psP82tKvzhB8Rfx/TPeJd
	+w14pcSSyfxoNRbVCyTPjflTmSJAAuiXZg==
X-Google-Smtp-Source: AGHT+IHfDPJCUPSeq4XDUWQHJAokM3yftuwn8RagApGbgpYHpfYiBx5vbT6ITl4KZKWwd62YkOVYXg==
X-Received: by 2002:a0d:f347:0:b0:5d7:1940:53df with SMTP id c68-20020a0df347000000b005d7194053dfmr6509375ywf.87.1702451667654;
        Tue, 12 Dec 2023 23:14:27 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id t6-20020a170902bc4600b001d343a978a7sm1668374plz.220.2023.12.12.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:14:27 -0800 (PST)
Date: Tue, 12 Dec 2023 23:14:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: input: gpio-keys: Allow optional
 dedicated wakeirq
Message-ID: <ZXlZ0I1mdtvbSL6H@google.com>
References: <20231129110618.27551-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129110618.27551-1-tony@atomide.com>

On Wed, Nov 29, 2023 at 01:06:14PM +0200, Tony Lindgren wrote:
> Allow configuring an optional dedicated wakeirq for gpio-keys that
> some SoCs have.
> 
> Let's use the common interrupt naming "irq" and "wakeup" that we already
> have in use for some drivers and subsystems like i2c framework.
> 
> Note that the gpio-keys interrupt property is optional. If only a gpio
> property is specified, the driver tries to translate the gpio into an
> interrupt.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Applied, thank you.

-- 
Dmitry

