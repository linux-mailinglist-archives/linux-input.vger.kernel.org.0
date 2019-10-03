Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90CA7C96B2
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 04:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbfJCCXx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 22:23:53 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43439 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbfJCCXx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 22:23:53 -0400
Received: by mail-ed1-f68.google.com with SMTP id r9so929088edl.10;
        Wed, 02 Oct 2019 19:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9FN6V4QrdzsUvVW/dG/yVdOmxthSwXB5hGzXqAq8Qo=;
        b=BXlR8jHbamYmCb99uvhHQsjZL8kx0l3LXLDx0CX8FKmUMQUhHxkjrohJoXR2AoeRey
         WZe18OejoG7MS+yPpIPi1Edr8YlN6HSb+H++UmaAA34QAo0JSaewiGzkqT7u10mJWSml
         j4VwEAHV4blRm0eBG06CkQuARIcXzWlNDyd16ADXaJ/LY2/HFabXQXRHSxpA6KKkETOR
         1SsN7mup60H8VEY4frnn+mmN09GcsvXIv8G7TiKjb3iS+CENXCdaQt8GYijjfhOpSx7a
         o6iW0LA98pK4rOFq/RZxjghywo3SCS88IH0UIev5YsLzpxA+gloCdf1Nh9aMra57Ll3m
         HXig==
X-Gm-Message-State: APjAAAWQwGBr3dWr4aKhLWktHjjbEvxkApDNGTf8RPSrRpM0Tp6JO9KB
        j4s8gEeJ1hFF2xGVJtuOIyKrHgh1Scg=
X-Google-Smtp-Source: APXvYqwyPYB+pG9zXGtNeGj8WJQd6Wjj6x5r3487plsxvP02v1TQwDLp2LxHNKTskjT6ez5Oilw74w==
X-Received: by 2002:a17:906:bcd6:: with SMTP id lw22mr5723933ejb.270.1570069430759;
        Wed, 02 Oct 2019 19:23:50 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id bc28sm184054edb.63.2019.10.02.19.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2019 19:23:50 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id v8so1124394wrt.2;
        Wed, 02 Oct 2019 19:23:49 -0700 (PDT)
X-Received: by 2002:a05:6000:1184:: with SMTP id g4mr5030891wrx.361.1570069429798;
 Wed, 02 Oct 2019 19:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120645.102805-1-mripard@kernel.org>
In-Reply-To: <20191002120645.102805-1-mripard@kernel.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 3 Oct 2019 10:23:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64jK_Sr5D4g0qDP2tfDFaH6PscHCJ8be5zcdy+nqunS2w@mail.gmail.com>
Message-ID: <CAGb2v64jK_Sr5D4g0qDP2tfDFaH6PscHCJ8be5zcdy+nqunS2w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serio: Convert Allwinner PS2 controller to a schema
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-input@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 2, 2019 at 8:06 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> The older Allwinner SoCs have a PS2 controller that is supported in Linux,
> with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
