Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00DE1473CB
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2020 23:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgAWWZM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jan 2020 17:25:12 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37069 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbgAWWZM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jan 2020 17:25:12 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so77374pfn.4;
        Thu, 23 Jan 2020 14:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=loMc8VqBmx96y24K3dR4+FpJ+qOyalpiFFIQ1tI6zRk=;
        b=QZnvLkcu0C2F1y9GuVWAqcKXcdxMtUyPulNNVse0MRx4I1+6mGgufJAiuDIfhVL8M2
         i2pcjMeT2KA7+1EtRDZa6JssAar2rv3em2MVjk45rJaHHqQx7scv9b+5zgXA4LSCL0Ax
         MvVr/8hQtaHvbslmZUtOsFuWQ3OK7ZXaYjSsnO3IT5upNAJhMn2k6rEpL8hcweDDLDwR
         f7pJY+RxqVM0sHfAUSjh4wnEsTgWkNTscENtvkYD8V/U9zmVd/7rrB8eMEv8YU9mn//S
         YUV2B3W/PwVPIOK98AuycK/HrYHBE6lCBYHSqxgpT98Ug+vdiaGRrWiTWJ1xkAsJ5Ys5
         XDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=loMc8VqBmx96y24K3dR4+FpJ+qOyalpiFFIQ1tI6zRk=;
        b=NN3oPyZQBf8zELAd4oDphSGwF92kH1OLTZOKmVpm340cQSH7tC2jnBRTB7ne1hzEqf
         CGU3cLlkMwMHdHlATTrW6WBkMdx+iEbmurb7VZ/oKiD4lC+dh6IE9zu6iCXavaQSA0ID
         bDJWoyy+bDXKMiR0ogv3LMNT+JXv6xgpG3JblMywnvl2C+wwosp/YJ8L6TF9dcUDJkFj
         cpnirfhdVvx+hqMuzLygpaUYRnhVy0hhsTpH2atnRnmCioIDELoMu+UneBFQleiONgFe
         FOWB4fXu45tIMqZbOLryAvmn0zYS0D7h9NKpl36memL2CNZ5G33XRfjrNNTpdPBQ13PW
         1hgQ==
X-Gm-Message-State: APjAAAXndzON5cIu4m7YRqa2rAhib6zLRirEZl3hnRLcgl9T5pWX/IZp
        d7rCThlXqPTQp0VxHpZAzeA=
X-Google-Smtp-Source: APXvYqzjFBeb248poaTBr/EAxCzVQf6JxkdU9X1xW36FGfStJml/QnU5kcVmNAI5UHOQbZmrdujtrA==
X-Received: by 2002:a62:5547:: with SMTP id j68mr461724pfb.6.1579818311387;
        Thu, 23 Jan 2020 14:25:11 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t65sm3612857pfd.178.2020.01.23.14.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 14:25:10 -0800 (PST)
Date:   Thu, 23 Jan 2020 14:25:08 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Convert gpio-keys bindings to schema
Message-ID: <20200123222508.GB184237@dtor-ws>
References: <20200123214222.17897-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123214222.17897-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

On Thu, Jan 23, 2020 at 03:42:22PM -0600, Rob Herring wrote:
> Convert the gpio-keys and gpio-keys-polled bindings to a DT schema. As
> both bindings are almost the same, combine them into a single schema.
> 
> The binding said 'interrupts' was required, but testing on dts files
> showed that it isn't required.
> 
> 'linux,input-value' was only documented for gpio-keys-polled, but there
> doesn't seem to be any reason for it to be specific to that.

Actually, there is: with gpio-keys-polled we take a "snapshot" of the
entire device state, so we know when to generate a 0 event (the example
we have a device with several GPIOs with values assigned 1, 2, 3, 4, 5..
values, when one of the gpios is active we generate event with given
value, when all are inactive we generate 0 event). This does not work
for interrupt-only driven device.

> +
> +      properties:
> +        gpios:
> +          maxItems: 1
> +
> +        interrupts:
> +          maxItems: 1

We support "interrupt-only" mode where we do not have GPIO, so for
"gpio-keys" we need either interrupts or gpios or both, and for polled
we must have gpios (and I guess we simply ignore interrupts if they are
specified).

Does this binding manages to enforce this?

Thanks.

-- 
Dmitry
