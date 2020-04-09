Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FFF1A3803
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 18:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgDIQ2q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 12:28:46 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45216 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgDIQ2q (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 12:28:46 -0400
Received: by mail-io1-f65.google.com with SMTP id i19so127596ioh.12;
        Thu, 09 Apr 2020 09:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Q9b9zgSQ81mVUAybVmzD/gAKDiHHwVoPGH9s2mlKMA=;
        b=Ibm5pQXuS4EwcyeE4B6bBMK7YEG68tCKJV9NETMaf+YKGzdsCApBSZFoEEmjVlq6nr
         mDcHZvnkhghvZTZ4zppyF/7u6mpQH5SsV+CyyQuSC7jVpMO3sSPF2gArVRNehsVvhDqv
         Vje/5VGFZjjN8mu39jTUwQ7c6UoqUgp+9de+K/UF+qj964IOL02WAmpGh361mwuu9S5j
         AZN1Qv0J/g8+8GfTg0SpJJj9UyIPshCoUf5OfZc+kvgDBde2fMJ9TD1g/uvl3Mzsfpqf
         jkSam04GnXW++PnHFh+/vK/akKtZ4DaNLgA/YPhnA97xqWzRs811N1xSqU9f/z2SkpqC
         7edw==
X-Gm-Message-State: AGi0PuaulAoheUcWnIREBMiY4KbYJJSfYkSUNG2vhfcYj5x1xkx+f9zl
        2Il5861ZppVjvxVc3DJsfgmb6SQ=
X-Google-Smtp-Source: APiQypLmYLyB1U1MUj3EPTyG2DH30/tFe5bus1SnkJZ0DW5KpxlZvDlKKbffwQz7M4OLrdKi0XpiiA==
X-Received: by 2002:a5d:894a:: with SMTP id b10mr37647iot.38.1586449725540;
        Thu, 09 Apr 2020 09:28:45 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o23sm9370742ild.33.2020.04.09.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 09:28:44 -0700 (PDT)
Received: (nullmailer pid 26987 invoked by uid 1000);
        Thu, 09 Apr 2020 16:28:43 -0000
Date:   Thu, 9 Apr 2020 10:28:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        benjamin.gaignard@st.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: touchscreen: edt-ft5x06: Remove unneeded
 I2C unit name
Message-ID: <20200409162843.GA26934@bogus>
References: <20200327192240.10458-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327192240.10458-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 27 Mar 2020 16:22:40 -0300, Fabio Estevam wrote:
> The following warnings are seen with 'make dt_binding_check':
> 
> Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.example.dts:19.22-30.11: Warning (unit_address_vs_reg): /example-0/i2c@00000000: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.example.dts:19.22-30.11: Warning (unit_address_format): /example-0/i2c@00000000: unit name should not have leading 0s
> 
> Fix it by removing the unneeded i2c unit name.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
