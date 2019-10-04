Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42DA3CBC46
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 15:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388864AbfJDNwe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 09:52:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34111 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388773AbfJDNwd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Oct 2019 09:52:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id j11so1536774wrp.1
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2019 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/NvVmuNoOB0cI3exs6clZvUlSAX7Buc7zqODPiW83oc=;
        b=BAWysBsPte1eDOFAueq6l7aDz/lo8WQ4I00OCGcelbXMKdAaHfz7FnmV8vaWJUtuJl
         XYSYy9P8BXBhxyBRaFO/SZb6sUBrhWoxzVUhi1BnayfEt6xfB1E5Syt3KiiCXlNIGXav
         5+xHo8reipGBqmVqZxoa2DV2l3RZ1j6EblIJkMIDZ1ZB4htJ3izRSLbDYNSGJZOzj17V
         Zcohv/yAKl9kPLc0stlmTD/HEXtMccfj5kHhf2ckYTm4pZ3pE2WiR7NYgy6LLP3LtgWU
         U4Lh1s3ay5tdxqXImbzaKSLyVkITdDOpt7NFl+N7jVXt3t+/EMW4I3u5+veWBLx/x9wj
         SNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/NvVmuNoOB0cI3exs6clZvUlSAX7Buc7zqODPiW83oc=;
        b=kwGx1L1Ti+kNDT7Yu8cShtoCLp39zh5HqJAMp/G+t1l/3pF6wvhR9XAfH24A18TmT/
         3jRCYR+y4vIMDISBvc1vFX41tYtSdrRbpOjdc8eZwPX/Mkr7q81Gk7J7EmQ0URqH2Uyb
         YFbkb1Qh7CbTKbvHWL4ZRVEI6cIUPSHqHporg4joxiNLbcZAvphHlI4ROGV+IiES7xCa
         XTvdpj1rszr6/PgnqvTCnGThEO2ka4B3q3mmEUj/IZa0Tf/xl7yic9e7de2+Z3MMg0x2
         HAUPu+tMnpd83CE0o4QRL3UyPO5DvNCh3WO394CPwCp38UfIa4/3l3AFlxC5dcRvCz1W
         3G3Q==
X-Gm-Message-State: APjAAAUsQVvj7zwjzaKNMoig6wZsHcW4L9RbGgadjM/erdO2Us9OytZQ
        flIRjt8D4P6kxHTlCKk49tWQiMXezWE=
X-Google-Smtp-Source: APXvYqy2g3UP4Xetnx/eP45GILdnzIptbOKDy3NsV2tZHWR0IcpxUDP5HKAjTn9LSSeZcbJQp0Ux3g==
X-Received: by 2002:a5d:4a09:: with SMTP id m9mr11842704wrq.93.1570197151233;
        Fri, 04 Oct 2019 06:52:31 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id x5sm5230136wrt.75.2019.10.04.06.52.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 06:52:30 -0700 (PDT)
Date:   Fri, 4 Oct 2019 14:52:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: max77650: convert the binding
 document to yaml
Message-ID: <20191004135229.GF18429@dell>
References: <20190930130246.4860-1-brgl@bgdev.pl>
 <20190930130246.4860-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190930130246.4860-2-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 30 Sep 2019, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Convert the binding document for max77650 core mfd module to yaml.

MAX77650, MFD, YAML.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../devicetree/bindings/mfd/max77650.txt      | 47 +----------
>  .../devicetree/bindings/mfd/max77650.yaml     | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77650.yaml

Looks okay in principle, but needs a DT Ack.  Preferably from someone
who speaks YAML.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
