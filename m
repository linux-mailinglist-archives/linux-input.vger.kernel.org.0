Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22658176813
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 00:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCBXZ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 18:25:28 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35585 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgCBXZ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 18:25:27 -0500
Received: by mail-ot1-f68.google.com with SMTP id v10so1170003otp.2;
        Mon, 02 Mar 2020 15:25:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OkU6h93T1z7BbIKFi2XT/lPbFqlFCSBzUI1f7w5xrXM=;
        b=YYSmVLSNI2ydfFTwuvIKuccg4Cp3GWgrDVpoe0VQeKabnBybKr54ozLa9LAJnjVeQh
         yJnClxF0OQuD18q7M8eLOOnz6lrB/ugMe6TwzcUpFeplC+Vu2GfkR1862WdRKc+yEPYT
         6jjXiwmucsW0tx5ESG9gaYjs3lUh8jQqIGAFGiCzAz7KVKRXokrQFbwVltkm7TSx+Vu1
         Rfo3fhNkQwaIAl3SX/VA3PXmGuN3klpHu8pcly2znV2E66HlkuE0Bxko6GJyaTlT1WwS
         lziAjq+jgtz+djwScZBPdD3pjyVODOc9Z0Qg8S8eEw9RtWm9xRlicHK0wO+97bpA5nQ/
         bxaQ==
X-Gm-Message-State: ANhLgQ3KQwWEYAAX5U6b/iShyZDph0F9tFRM4lPCBDp9ZtoLUKrd5EKx
        EItI+LemkcVFXjTcwH3vbg==
X-Google-Smtp-Source: ADFU+vt6nyQwvzyGCVGjnZvcOohd30nERptmkf1F6xc1R7WZ2cUFjUGFfnfoCsjmS0qa+/CP/L7WJQ==
X-Received: by 2002:a9d:6c01:: with SMTP id f1mr1198139otq.133.1583191527119;
        Mon, 02 Mar 2020 15:25:27 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w2sm1750081otq.10.2020.03.02.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 15:25:26 -0800 (PST)
Received: (nullmailer pid 31631 invoked by uid 1000);
        Mon, 02 Mar 2020 23:25:25 -0000
Date:   Mon, 2 Mar 2020 17:25:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH v3 2/2][PATCH RESEND] dt-bindings: input/touchscreen: add
 bindings for zinitix
Message-ID: <20200302232525.GA30485@bogus>
References: <20200302201216.12410-1-michael.srba@seznam.cz>
 <20200302201216.12410-2-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302201216.12410-2-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon,  2 Mar 2020 21:12:16 +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for the zinitix bt541 touchscreen.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  changes in v2: none
>  changes in v3: document zinitix,mode property
> 
> 
>  .../bindings/input/touchscreen/zinitix.txt    | 40 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
