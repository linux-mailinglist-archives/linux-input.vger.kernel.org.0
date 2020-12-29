Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975E72E6E75
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 07:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgL2GTX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 01:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgL2GTX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 01:19:23 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD56C0613D6;
        Mon, 28 Dec 2020 22:18:42 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id hk16so994550pjb.4;
        Mon, 28 Dec 2020 22:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iQ57yDlhaXQP4FMUP6u+cqmcjHx6tyVwVCZONWgFI3Y=;
        b=LDYhSWjHMTEZ6f9yejIxbZFELwf52UcOV0uLIcQYwV5DrC1fpzcn3jPAVzlTJ4alwd
         yvlwG+8eBNz85zBybs5uTjQN6hYK1G2UGYlhrW1jgnI01ONT5o3CZkp5YitiYxWlYoYG
         gcwkQophOqFjSpXVz5ciUlbhTd5Q//dMmOF3oL8Zk1ofo4uGoIeyu0edctwkHFXwzv3Z
         GO+3Em6SA/3bzXDRdIO1F+bkGi5Dme+L/daCF9LsQqesKlID3skrL2k/MGfFx0Tf7xy9
         TqrUXl12V5TN2/0f+SLaB4ikTvDax54Rq9s9PGUQu4+VOtOXYIhVWJsIctPnavC3Bxmq
         NUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iQ57yDlhaXQP4FMUP6u+cqmcjHx6tyVwVCZONWgFI3Y=;
        b=Yb9IvO0nrDGsb8OZ61Db3RgjwEsB6YMU5d82yUTvkyuCU1rCrOYE1NgS1tTBkJgLu+
         wgBVwKMyancWXxyKBORedskJPr27EKpgaw5uDMXGLkgauXp2NzPken6yuVEPTE+V5l13
         NLf7jrgnoBNErSt5agFGoD8rfZepo5IrVixDs8bLi2Qef8HDNqpYPXffnhUne076Az4B
         cZUu/zrrgwiOAs4ptatMc+FkcdSKEkfOTDfHQ9/QV6cDV56OivuJEmFRasDld9PTqoY6
         mBTcezFg/ZzRcCyF5F/dNPnhC6OW1jxmWMVOnKNzuW+lvP0g8ep/C4dC686cWzbqm9jh
         yq7g==
X-Gm-Message-State: AOAM532bW0VFbgdDePTrN47gsG0y7uMM8w9en+XjxhxeKqtfWnmN54jU
        IMczGmY9Kw4BHMhchBMMs1Q=
X-Google-Smtp-Source: ABdhPJwqdYggJ2xmahWNQn4DJwa7BSHZGjS6OB7HaO4SDM3vKKOT/XjeyxtehZtw4odI8f3tgo4IqA==
X-Received: by 2002:a17:90a:1c02:: with SMTP id s2mr2671199pjs.212.1609222722132;
        Mon, 28 Dec 2020 22:18:42 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v3sm1657993pjn.7.2020.12.28.22.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 22:18:41 -0800 (PST)
Date:   Mon, 28 Dec 2020 22:18:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, dtor@chromium.org,
        swboyd@chromium.org, dianders@chromium.org, rajatja@chromium.org,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: input: cros-ec-keyb: Add a new property
Message-ID: <X+rKPhJrQaykPxri@google.com>
References: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221174751.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Philip,

On Mon, Dec 21, 2020 at 05:47:57PM -0800, Philip Chen wrote:
> This patch adds a new property `google,custom-keyb-top-row` to the
> device tree for the custom keyboard top row design.

Why don't we use the property we have for the same purpose in atkbd.c?
I.e. function-row-physmap?

Also, instead of specifying keycodes in this array we should use
combination of row and column identifying keys, like this:

	function-row-physmap = <
		MATRIX_KEY(0x00, 0x02, KEY_F1),
		MATRIX_KEY(0x03, 0x02, KEY_F2),
		...
	>;

Note that the last item in the triple is purely cosmetic in this case,
you can change it to 0. It is row and column that are important.

Then the mapping will work properly even if we change keymap, for
example from userspace.

Thanks.

-- 
Dmitry
