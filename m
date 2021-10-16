Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2CD43030C
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 16:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbhJPOgt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 10:36:49 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:39859 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbhJPOgt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 10:36:49 -0400
Received: by mail-ot1-f49.google.com with SMTP id e59-20020a9d01c1000000b00552c91a99f7so865852ote.6;
        Sat, 16 Oct 2021 07:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j1810wrRi1+sqKNjD8mg1sEmulNnuM8qTf6RHFoW7SQ=;
        b=z+0MpyzMAB5sEoTtrwBfI6RY/XvZy+GTEfVXWPRtzWc83naRcBdK9THUBy5C6E1CS9
         K48b5b4QwOKf/p8eWEGdrb3frx6hBwZI39Br8dQHiU1PQxOzDgtzNQP0Mo7vin+62z/g
         WIGPLHX/jqsloRHi55b2qZjaHP9mQBgROSjBHcGvC1Hzj8maHEMxFE1FGsRYchMU+lI/
         VtN9eBpWYfZEhc+Va6YZlR2zRDTEf2Wtrx0aUQeembA0QXhz+FJGQMuGOO56EfsNHJaL
         +NmSMGcLESi5d51aQVoCPMZjqMnnXTn/yD3nrQvqSg81uch8d1LiiFyKJs2dMXh16kqc
         FkHw==
X-Gm-Message-State: AOAM531pZHi9BsyJY+TXUVggAKbLd6HTYUmMbMN90tAINbfl9LK7/4Mn
        S2ytzzaXdAqGYoFSIcVRPw==
X-Google-Smtp-Source: ABdhPJwFDvklE+gWKoVxXSGwq216GQRczbTqIz0XmD8ebMcayqZ3/KVkyTA3etnzlABCEsG0vNEugg==
X-Received: by 2002:a9d:86e:: with SMTP id 101mr13164167oty.177.1634394880791;
        Sat, 16 Oct 2021 07:34:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o80sm1884047ota.68.2021.10.16.07.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 07:34:40 -0700 (PDT)
Received: (nullmailer pid 3904092 invoked by uid 1000);
        Sat, 16 Oct 2021 14:34:39 -0000
Date:   Sat, 16 Oct 2021 09:34:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     shawnguo@kernel.org, dmitry.torokhov@gmail.com,
        s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jikos@kernel.org,
        linux-kernel@vger.kernel.org, alistair23@gmail.com,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the
 data values
Message-ID: <YWri/85NRl8s+h27@robh.at.kernel.org>
References: <20211009114313.17967-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009114313.17967-1-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 09 Oct 2021 21:43:10 +1000, Alistair Francis wrote:
> Add support to the Wacom HID device for flipping the values based on
> device tree settings. This allows us to support devices where the panel
> is installed in a different orientation, such as the reMarkable2.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../bindings/input/hid-over-i2c.txt           | 20 ++++++
>  drivers/hid/wacom_sys.c                       | 25 ++++++++
>  drivers/hid/wacom_wac.c                       | 61 +++++++++++++++++++
>  drivers/hid/wacom_wac.h                       | 13 ++++
>  4 files changed, 119 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
