Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8FF38BB9D
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 03:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236883AbhEUBgg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 21:36:36 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:40628 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbhEUBgg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 21:36:36 -0400
Received: by mail-ot1-f48.google.com with SMTP id 80-20020a9d08560000b0290333e9d2b247so6086541oty.7;
        Thu, 20 May 2021 18:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TfV/mhdQ/3ecNt1XpKG5B5mDpc56jf+8L+qamP/KzA0=;
        b=OLc7L9opXw0rFwFPVmVV/w7XAvUj1U8xPFnBPCLeuVPlL8VicXF21W/wAmJ6KlqSvE
         Uiv5kW1Gw0VNOz8NYf51v5LwwsraAxZGaBxQsDRQlsErg8dLLEVrEhcRis04dLZEGdEn
         Xd3nw+Kb7CrYnQ8brdC6q/xxaw81r+7iShhLPIQ2mJudqdbTGCjQZ4rfsqZnM0V3qEUg
         DoQyCx/JDjNwNH5oJsoxhG55RDAu3PYl3n79lPtaF4aMZkriuL5RYxKF/c5gVCwTnqHl
         QJnZNGlslrrDG7UvbKnR7xvwtdPDRB8kIK+LY99czsFpfeHjjIfaF7V1DquOqS6gEHLx
         yKpA==
X-Gm-Message-State: AOAM531rPoIsVK8GecDk4qPQrIAGitJUoXT8hag6Wxy/3VksLuThga8g
        1wv8yK0Savmb3qnAnhNUbQ==
X-Google-Smtp-Source: ABdhPJz1Ruto0zec1LPbixbmkFUglUUhffyFlXJzRa9YolfXrFc/bHDbcftacvE3txlVDhwtTBYR3A==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr6226458otb.257.1621560912795;
        Thu, 20 May 2021 18:35:12 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i26sm895724oos.21.2021.05.20.18.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:35:11 -0700 (PDT)
Received: (nullmailer pid 2451742 invoked by uid 1000);
        Fri, 21 May 2021 01:35:10 -0000
Date:   Thu, 20 May 2021 20:35:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     kernel@pengutronix.de, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, David Jander <david@protonic.nl>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: touchscreen: Convert
 resistive-adc-touch binding to json schema
Message-ID: <20210521013510.GA2451713@robh.at.kernel.org>
References: <20210519094221.27792-1-o.rempel@pengutronix.de>
 <20210519094221.27792-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519094221.27792-3-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 May 2021 11:42:18 +0200, Oleksij Rempel wrote:
> Convert the resistive-adc-touch binding to DT schema format using json-schema.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../input/touchscreen/resistive-adc-touch.txt | 33 ---------
>  .../touchscreen/resistive-adc-touch.yaml      | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
