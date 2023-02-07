Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3895468E084
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 19:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbjBGSuK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Feb 2023 13:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbjBGSuJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Feb 2023 13:50:09 -0500
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D0E19A;
        Tue,  7 Feb 2023 10:50:09 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1636eae256cso20265107fac.0;
        Tue, 07 Feb 2023 10:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTDL5p/pTbIdyDhATHrIIT1r/vINYB51ZWjkQyx4Uh4=;
        b=CKmHviB3M67xKw1fXKlflzS+q+ZRIpQGR3gKhomTAfjG1PlkG8te8aJcS18x5FCH09
         tfaxcNmPjaIQON0ELqMem3MXPs5dpIZvUf2+wJ0ZywFTbzWVZYFTWKS4k8iNokzvZUs4
         iOERbtp1HhApqxqUNGSf+AjMpuaiBk+YhN16ogJnXJsTDYThGt8l7nQwf3pELwjOET6x
         xqS14+jmPH77bfwJ2LBnCMlk20wN58ha4uURYfBSFAHhqRH2STONwH79kajTM1cqoPsi
         6cqWOJXxyNYOcLrazAZtzoNrFARdGARVduAWWVG1Ur6q7uQ35RFv9WcijmE1Yj37bqFE
         zFIg==
X-Gm-Message-State: AO0yUKXsMYXDGNRH/GvhYNVWh9xwM0z5n3941jjd1LFQ0ZZihYUE+4sA
        kw+x33ISR7Y7qLryQ0vU1A==
X-Google-Smtp-Source: AK7set/uq6PAvMroOKOLPrUyaFY/Rpknih6ElrHi9snX+d00WQKGrRneh4G1sGVrhaWND76+QIvj6g==
X-Received: by 2002:a05:6870:1615:b0:16a:9569:50ee with SMTP id b21-20020a056870161500b0016a956950eemr229762oae.21.1675795808538;
        Tue, 07 Feb 2023 10:50:08 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n38-20020a056870822600b00155ffbdbaffsm5797178oae.18.2023.02.07.10.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:50:08 -0800 (PST)
Received: (nullmailer pid 3965871 invoked by uid 1000);
        Tue, 07 Feb 2023 18:50:07 -0000
Date:   Tue, 7 Feb 2023 12:50:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20230207185007.GA3962587-robh@kernel.org>
References: <20230206135016.6737-1-kaehndan@gmail.com>
 <20230206135016.6737-2-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206135016.6737-2-kaehndan@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 06, 2023 at 07:50:13AM -0600, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.

My comments on v3 still apply. Please slow down your pace of sending new 
versions so folks have change to review.

Rob
