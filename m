Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F64834B921
	for <lists+linux-input@lfdr.de>; Sat, 27 Mar 2021 20:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhC0ThS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Mar 2021 15:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhC0ThQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Mar 2021 15:37:16 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102B4C0613B1
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:37:15 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 32so6839695pgm.1
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9QmYp0TkNpbjrOIymDvdhgejnrrljIFJTOfaFhtJ3/s=;
        b=BnNxHFa3lGWfhQK3ltKri3nicKXHyj+FHezcIapK+L3zJPEWTGYr+bSNdBED4UkMRO
         xIc/qdbKJiwKLPOlMn4ae4d44o1HzsTtoM+KrgZGcGz6SuU5apUmwj7LG9aD7yYxIX8Q
         hX9ELjD0dV17DduwbbFwBgWNhX5/OsgV5wl1misdU5ce6anmYwU9uyooP26A0SJX6Bo/
         YFx5y7OiYUoHyewSEhceKX/Qceff4uaSh8vLGFri+ddBxwXiSi69InCAioCgL/FuLdgj
         k40605F7vEegLNPBlPSF3rRPqKfNdTZy2oN9yRTRW6KoCNd7Lg1WmXy0WRYTPwuC7Sdj
         xK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9QmYp0TkNpbjrOIymDvdhgejnrrljIFJTOfaFhtJ3/s=;
        b=ald5Ed3lfX1iQqxXoAlZ0VmwDGEel8YS7lDyeW+Sut15JOkcej8B/kosQEmdWnQJt+
         AX6GF1/YsM6xTDJWptOEIuhwEiC6QfPryicA/ftOzngTUfuOcIUkAqAInvj7PUhtU66H
         xUkbKo+ycdHg3XmgwMT4Vjqu+n1w79A4VYtaRpS3M/+3AITVOKNPau4PAiLoPGlp+cJg
         990hX0n+fFFtKwXKh4CrH7ERhEqS17HAxVH/aaeeCDlRdamWs73rz+KzjXw6tSV6WqgH
         IWDTJJT2KqdHQ3aiDyajKo8jK2usiLw14yh9cMSXfgwWy64whFTOwPJw0dW/fhVfw5IJ
         DjxQ==
X-Gm-Message-State: AOAM531qgPvfL8PIKPt74pdZN0pfsXUInCh6aGLdNHEa7hGAWyf580CA
        u25s1Dq+xUldx9rzPgvS7sI=
X-Google-Smtp-Source: ABdhPJwL/wv+cI+WIHl/fCD63KBxTOmVhCuHkEVn50F81KxyFtNdrequfG/2iu9aNOO6qwkBNoVaiA==
X-Received: by 2002:a62:ea19:0:b029:1ee:5911:c516 with SMTP id t25-20020a62ea190000b02901ee5911c516mr18434387pfh.67.1616873834398;
        Sat, 27 Mar 2021 12:37:14 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:583b:ffbb:e0ea:e126])
        by smtp.gmail.com with ESMTPSA id c128sm12793111pfc.76.2021.03.27.12.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 12:37:13 -0700 (PDT)
Date:   Sat, 27 Mar 2021 12:37:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: imx_keypad - convert to a DT-only driver
Message-ID: <YF+JZsCSY4C+StK5@google.com>
References: <20210316133534.224105-1-festevam@gmail.com>
 <CAOMZO5A36YbA59v4NmEFjhkcXF5fTDRn1204_U3+X86qfbqB9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5A36YbA59v4NmEFjhkcXF5fTDRn1204_U3+X86qfbqB9g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fabio,

On Sat, Mar 27, 2021 at 04:14:46PM -0300, Fabio Estevam wrote:
> Hi Dmitry,
> 
> On Tue, Mar 16, 2021 at 10:36 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > i.MX has been converted to a DT-only platform, so make the
> > adjustments to the driver to convert it to a DT-only driver.
> >
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> > Changes since v1:
> > - Remove dev_get_platdata() and the pdev->dev.of_node check (Dmitry).
> 
> Does v2 look good?

Sorry, I am still confused why we need the OF dependency given that the
driver can be compiled without CONFIG_OF (of_device_id is always
defined) and, as far as I understand, while entire ARCH_MXC is not
selecting OF, all real users are converted to OF.

I guess if we really need this OF dependency we can make it:

	depends on (ARCH_MXC && OF) || COMPILE_TEST

Please let me know.

Thanks.

-- 
Dmitry
