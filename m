Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A036238CBE6
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 19:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbhEURTu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 13:19:50 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:33440 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238152AbhEURTs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 13:19:48 -0400
Received: by mail-ot1-f45.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so18733132oto.0;
        Fri, 21 May 2021 10:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j+/xJmBY7pq1qbFR7wHoaizpBEa7JH4fP31ibIY4XBs=;
        b=kPE0E3Ba4Gan/7IGYtS9d4grdpGkGs9eKPqDyAgnJJDCyUO1IolJIu18GGAa1HV+Z9
         8iKyBqYQb8T22CiAj8pqAEnXxjJHFYtPaJMlr+k7SQ8NC/+UwyJnOPQ/ADkrNUf+b/5q
         b2r+KlcygHCghf+syZh836krDlZTpw2BQftPHcX5picxH9DYd+RjNsQUKsnxsgPpm6A4
         EpHkplljV5vqXKCsj4oR9PpGVjPCVyKmazg0OtjRpfhstP8x7OzC+eePhfkjZ2qOUA8g
         5sq0sCnSQmXv8S2AkTCEvosX6vrdKHj1WPSGQj9F+DrM2cNV7QUvB+oWzGjJz0KDxzs5
         DD5Q==
X-Gm-Message-State: AOAM531Ct+WCF2+89Lt4XmBWq6DMDFcNlv5C+qN6p7m2PO2xcbk+6Rkp
        /tEc7zExjfzdEo+P+KFDOg==
X-Google-Smtp-Source: ABdhPJy7h7tmhIVJ5MiB4UQvHcOhc4SZEq7deqgX67sKvpetjdU0toiFtBRmKNvAAS+ffhvBnD11YA==
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr9018103otd.13.1621617505057;
        Fri, 21 May 2021 10:18:25 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b8sm1401265ots.6.2021.05.21.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:18:24 -0700 (PDT)
Received: (nullmailer pid 33060 invoked by uid 1000);
        Fri, 21 May 2021 17:18:23 -0000
Date:   Fri, 21 May 2021 12:18:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     devicetree@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, David Jander <david@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH v5 4/8] dt-bindings: touchscreen: validate nodename
Message-ID: <20210521171823.GA33003@robh.at.kernel.org>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
 <20210521044525.7397-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521044525.7397-5-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 May 2021 06:45:21 +0200, Oleksij Rempel wrote:
> Validate touchscreen nodes. Make sure it is named touchscreen*.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/touchscreen.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
