Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B37DBD28
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 07:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442014AbfJRFlo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 01:41:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39893 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438069AbfJRFlo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 01:41:44 -0400
Received: by mail-io1-f65.google.com with SMTP id a1so5991729ioc.6
        for <linux-input@vger.kernel.org>; Thu, 17 Oct 2019 22:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kXqnAV3BvDQ/yTcBOlg44rzpqzO4grBXIpdUaNHFpQ=;
        b=PhnfsjBnStwgloirkfrQMlV2aEsZgdjJJYMMe4A4IQ4IOi7S5uTcWFfa32j3iBFQ/c
         WKP0QCImurjrSkiceZZAukElEIbY5ETTtk/r3+2bTga5P5okeD6N2xDfVzOSJ26jZrZb
         djreQpXMmnivyvDKN4QHv4ghUZa8p1i1TwL34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kXqnAV3BvDQ/yTcBOlg44rzpqzO4grBXIpdUaNHFpQ=;
        b=Kuj+rdSnJNCPsTnYhuYPCDUMEcdAwcPEGXeKYstcUsX8hDsHNCPtkt3XI5L7jlw+Qe
         ZoV9SML1rD16FtRZ8YrWrj4oqU9obxq9POyPxzRiWhISgNJMsuuo/j8+rf84hnnPmskU
         f6GAT4z7PUUcq+wWL6O5FiII0ngFIvSuIiYJgQjZJzjOaDuIUZ/XnOQfIZpljVxaBwJZ
         F5vfwiwTM1bLL+ME4ifNnm+ICTdoe7UgyETZygJKY1lsa9f+GmZYLiv9M0f5Q56E4Z0l
         DVXNNfwDeHTuzgWdQle+Wxv3UMzlHXFsHo9nIi68NqYN8Zlgt1CDYlxQAaCs3TR9B66Y
         cPKg==
X-Gm-Message-State: APjAAAWP4yTldKugaw3NNVpCfESJdIvYYTbudohhtf4Uwp9jidBoj020
        oQvmp82QVkJ2nx1LieFZIaC3kvwEYhAqDNNYdiEcKGkymo8=
X-Google-Smtp-Source: APXvYqwRxgKDLPgCCYZeE7qFw9W3nfXIYvw2H5isnZMGpt16134pjaIMVP22T7ZwatWVHujSSxBd+jnA+/zRmW39ymg=
X-Received: by 2002:a63:d415:: with SMTP id a21mr7371460pgh.299.1571368242911;
 Thu, 17 Oct 2019 20:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191005101345.146460-1-ikjn@chromium.org>
In-Reply-To: <20191005101345.146460-1-ikjn@chromium.org>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Fri, 18 Oct 2019 11:10:32 +0800
Message-ID: <CAATdQgBQiFnP3+Dtz8EGCRNiCOWRoJ+zK25iESNLPmVJ+exPmw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: input: Add DT bindings for Whiskers switch
To:     jikos@kernel.org, Dmitry Torokhov <dtor@chromium.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A gentle ping on adding DT binding for Hammer (1/2).

On Sat, Oct 5, 2019 at 6:14 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> Add the DT binding document for Hammer's TABLET_MODE switch.
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>  .../devicetree/bindings/input/cros-cbas.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/cros-cbas.yaml b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> new file mode 100644
> index 000000000000..3bc989c6a295
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/cros-cbas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS Hammer's Base Attached Switch
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +description:
> +  This device is used to signal when a detachable base is attached to a
> +  Chrome OS tablet. The node for this device must be under a cros-ec node
> +  like google,cros-ec-spi or google,cros-ec-i2c.
> +
> +properties:
> +  compatible:
> +    const: google,cros-cbas
> +
> +required:
> +  - compatible
> --
> 2.23.0.581.g78d2f28ef7-goog
>
