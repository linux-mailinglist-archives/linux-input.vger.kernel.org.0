Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE733D84C9
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 02:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbfJPAYF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 20:24:05 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40101 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfJPAYF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 20:24:05 -0400
Received: by mail-pg1-f193.google.com with SMTP id e13so4942902pga.7;
        Tue, 15 Oct 2019 17:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=H/S+TQBLJfEe+I6hNdxsUzkhOSFyaxSNQVsoSN7dl04=;
        b=im6X8KR9Hm0r5LZP9CgtJbj5VTDSqYDJpXYbAkFigQGzm+siDpWfE9gujWkkJDAnrk
         ehFSr7NS4k/q1pdWrKaO+m8G7QPkyIYY+7GZ1iot6swBKMwvjq9sgaRvxarN3pJ6B2H6
         qpdYjhkG4jEoBKHuJYU8C+O9sBnfbjC0xWPf3oCSXeaYpbTI4KAmwN4o7IWcXPI2GCm4
         RXGMRxPSCD9siI0lcsFuESh1K7glufhOlxODfpzGKawpP2lApAHSANUw/QqqMSuRr97h
         tGbS4RuMurflKuP6A56nvl+dKOFfvwiTkXLgAmw0vv+5nACgmLKEkpAoF+yx3yXn4OyE
         LPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=H/S+TQBLJfEe+I6hNdxsUzkhOSFyaxSNQVsoSN7dl04=;
        b=ArJHH7Egfu8K1DisUIUnoUa1Ta+3IALhsOT6U2jpwycKLAgrLyHVH3+hZr3ich5A48
         +remSp5HIAQvqjp8UY9MtqDJRrlNeAC8m35DxF8MC7LQjFcYIRCYIJbNwiLe6hyK/O70
         xh3URWdLIBjbNJ08RvoXWFYZInfHTetkhJAOouFLc7jb8iz00V3GsPecn+EROwoKaHmP
         EN2KY7heCMM8mvSOQsuFWFldH5HwLk1LSj/FCZ6hS8PT3MyqB2oieb1Sgo51lMV52dno
         hJCzhuCJGGxeeHBHVTTy74w3qdivuLpW3dN+k2lmIjomzKZBb+OD/wEbeVif9CGkk9o8
         +/YQ==
X-Gm-Message-State: APjAAAX/pJIpy6Fd9u5JBgrvzr8RqbOfDP1Y0st2DqK/bs+rHZebcF6W
        blsrN9d/Jp6IVcYBckXiWtE=
X-Google-Smtp-Source: APXvYqxxGQ0eA2tJukHw3TxmBYQG3RMRYTYII+5AtwtwQb9NGgFr9EjqrGbOeI+3xcaPTezvt8WXaw==
X-Received: by 2002:a62:28b:: with SMTP id 133mr40539402pfc.242.1571185444359;
        Tue, 15 Oct 2019 17:24:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z20sm24297675pfj.156.2019.10.15.17.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 17:24:03 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:24:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: input: Convert mpr121 binding to
 json-schema
Message-ID: <20191016002401.GL105649@dtor-ws>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-3-git-send-email-michal.vokac@ysoft.com>
 <20191010193651.GA16598@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191010193651.GA16598@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 10, 2019 at 02:36:51PM -0500, Rob Herring wrote:
> On Thu,  3 Oct 2019 08:12:53 +0200, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= wrote:
> > Convert the mpr121 binding to DT schema format using json-schema.
> > 
> > Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> > ---
> > Changes since v2:
> >  - None
> > 
> > Changes since v1:
> >  - Extract the common input properties into the input.yaml schema.
> >  - Fix the wakeup-source description.
> >  - Fix the example to pass validation. Put the mpr121 device sub-node
> >    into a i2c {} node.
> > 
> > The linux,keycodes property is not valid as it is. If I put the minItems
> > and maxItems into the common schema, it is valid and the min/max length
> > check works fine. Rob, could you advice how to fix this please?
> > 
> > The error is not very specific..
> > 
> > $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> > /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml: ignoring, error in schema 'linux,ke
> > warning: no schema found in file: /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> > /home/vokac/development/sources/linux-fslc/Documentation/devicetree/bindings/Makefile:33: recipe for target 'Documentation/devicetree/bindings/p
> > make[3]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Error 255
> > /home/vokac/development/sources/linux-fslc/Makefile:1264: recipe for target 'dt_binding_check' failed
> > 
> >  .../bindings/input/fsl,mpr121-touchkey.yaml        | 66 ++++++++++++++++++++++
> >  .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 ----------
> >  2 files changed, 66 insertions(+), 30 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
