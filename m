Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B486921AB92
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 01:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgGIX2c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 19:28:32 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38875 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgGIX2c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jul 2020 19:28:32 -0400
Received: by mail-io1-f68.google.com with SMTP id l1so4169691ioh.5;
        Thu, 09 Jul 2020 16:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N0F6d02rpbZNASOsvBZdX7VJjxs2imsa5ZI8mX+lbSY=;
        b=kWyk5mT8vw4a1BSmaVgFZiP/NkG4sEJIAZTetZiLxS7vtd56EuK4HIf4a2P0CIwPZV
         2Tt/Wjwmd+n3B4iFl8vmx8o8xAQ9vt+jJ+ZEOuqKyjNZ0/fv/s9LWh3+rOlkLYne5B1Y
         Uj/UDdjhB6z5w7yDyKXH4SLH0zB5PfPDe8Zdn0Olc4cAfnvLSKsW/L1FXpKPnydpjj9v
         iCjxa6GNMhXfJIafsKt8rLAWJBv1zveKZtnVMi4h4afTeiSY8Z20MXhPU/5qMkVDD4DJ
         NgnrOEryJ0YTmo3VZteDBKiqpK/8CoTw69Sef+iUabtORDcOa7ohG7I1we81hPTJtnDJ
         YjCA==
X-Gm-Message-State: AOAM533/SvCv5zmtKV+9BsRz1amY6uyuMt7xW+SPlvyBPCsUbuctWVGU
        i4u05XjwfOwT/uzGJJvhMQ==
X-Google-Smtp-Source: ABdhPJxh3+kNFZegJWX/MqCXps1jwBYVMzv5ZaXQliSqmJHszgsRAQRbkL/jQmt8WNJekbSGIjQMPA==
X-Received: by 2002:a5d:9752:: with SMTP id c18mr21131081ioo.10.1594337311795;
        Thu, 09 Jul 2020 16:28:31 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id v16sm3095056iow.19.2020.07.09.16.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:28:31 -0700 (PDT)
Received: (nullmailer pid 1099057 invoked by uid 1000);
        Thu, 09 Jul 2020 23:28:29 -0000
Date:   Thu, 9 Jul 2020 17:28:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Linux-imx@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        s.hauer@pengutronix.de, olof@lixom.net, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gnuiyl@gmail.com, linux-arm-kernel@lists.infradead.org,
        festevam@gmail.com
Subject: Re: [PATCH V2 2/2] dt-bindings: input: Convert imx keypad to
 json-schema
Message-ID: <20200709232829.GA1099006@bogus>
References: <1592285467-18371-1-git-send-email-Anson.Huang@nxp.com>
 <1592285467-18371-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592285467-18371-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Jun 2020 13:31:07 +0800, Anson Huang wrote:
> Convert the i.MX KEYPAD binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- include matrix-keymap.yaml and "linux,keymap" is unnecessary now, remove it.
> ---
>  .../devicetree/bindings/input/imx-keypad.txt       | 53 --------------
>  .../devicetree/bindings/input/imx-keypad.yaml      | 85 ++++++++++++++++++++++
>  2 files changed, 85 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/imx-keypad.txt
>  create mode 100644 Documentation/devicetree/bindings/input/imx-keypad.yaml
> 

Applied, thanks!
