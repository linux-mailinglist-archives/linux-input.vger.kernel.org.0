Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2563F49331D
	for <lists+linux-input@lfdr.de>; Wed, 19 Jan 2022 03:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350796AbiASCrp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jan 2022 21:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351075AbiASCrl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jan 2022 21:47:41 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8F2C06161C
        for <linux-input@vger.kernel.org>; Tue, 18 Jan 2022 18:47:41 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id i129so1138915pfe.13
        for <linux-input@vger.kernel.org>; Tue, 18 Jan 2022 18:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UTann2Srql5tgXPh+TG2Ub/jQKYOsrhCVsZWHj7az7Y=;
        b=fN8Co7YOK/xIWMC392mZ0oQnPf4ECFAXrFypU3p214JnhXVPT4L+7QS9Cn2oRhQC1K
         Y9kT1GYrVVjlaHrOznwbwHyGsIJiVsfd6F/fzxkG/z0kvWYrp7hE6qM1wTTpYdbnuGn+
         GvRMNn9VTzpw13hjJwNOSX424ox+KtmC/MgRNiF0FXDXSPD8F0DO95+Ps+c7fff6L4hi
         AXgLHN2xqot7u/EQwgdHquHEu1el92CyrMc41EId/4f5Qu3D6pqoAoCh4BUnK5CELSIq
         IcJfioRTrjmojBkqHHiqK8lzPtUth1m5ocKmQyhnzwMezMB88DrGB+xFsRj01waJNRRi
         0JrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UTann2Srql5tgXPh+TG2Ub/jQKYOsrhCVsZWHj7az7Y=;
        b=GuD1IR/UOEhZOgLdud/2oFfbiA3YWWuIel7WX0US8XXmfgKGVA3/3jQWX4f+mZ2OTi
         V2gRIS6OlDGHyn8Ed4e+8CYqF8g/3fafiArfqP2shm0PwU/bo5sFROUORpjkKcBd55di
         gRt4uHLMRDTxEA9DayVuVwqBK27aXryHttzK+p/9o/WAa7LUe8a9Uw2AvI9VgUaTc/p6
         SSEIVA8zLyutoghR2AP4jCtnsh9Rvl9raIlr7ZwaMvjINZCXmYSmfEjXBxrHTSbkN61P
         Jmih9LO21SVEkefQSlVbAGvxZsKIqk7RZTZ2Xoa5sgSJcMPMNKxSmEkCTIEJ+KHXcy03
         4VJA==
X-Gm-Message-State: AOAM533gvBzYiDFRlmcNs0PVmVpvZ4XEQrg/4AQGCH3cTUK3BIrpXq9J
        8JmFnnaoyWFxQlIFhhbm1KCW67GpIAQ=
X-Google-Smtp-Source: ABdhPJwNwmnBIoFNkQIvPnd85tMP12R4p/xFbBVCpz/le9+GbTM3G/vZeJQA3hJif1kezhBGzU/lXw==
X-Received: by 2002:a65:5bc4:: with SMTP id o4mr25459392pgr.489.1642560460452;
        Tue, 18 Jan 2022 18:47:40 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bf2e:59:5029:f4c5])
        by smtp.gmail.com with ESMTPSA id oc11sm4617746pjb.5.2022.01.18.18.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 18:47:39 -0800 (PST)
Date:   Tue, 18 Jan 2022 18:47:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Minh Yuan <yuanmingbuaa@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: A concurrency uaf in psmouse_smbus_init
Message-ID: <Yed7yT+iA4fE++3R@google.com>
References: <CAH5WSp41FN6wjmKW0CsgODiyWDm0WAs-gucTcskdifqY3FQuRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5WSp41FN6wjmKW0CsgODiyWDm0WAs-gucTcskdifqY3FQuRQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Jan 17, 2022 at 10:17:25PM +0800, Minh Yuan wrote:
> Hi,
> 
> Our analysis tool detected  a potential concurrency UAF in
> psmouse_smbus_init in drivers/input/mouse/psmouse-smbus.c.
> 
> One possible thread interleaving is as follows:
> 
> Thread 1 Thread 2
> int psmouse_smbus_init(struct psmouse *psmouse, ...)
> {
> mutex_lock(&psmouse_smbus_mutex);
> list_add_tail(&smbdev->node, &psmouse_smbus_list);
> mutex_unlock(&psmouse_smbus_mutex);
> void psmouse_smbus_cleanup(struct psmouse *psmouse)

init and cleanup will not be running concurrently for the same device,
and smbus companion is not shared between psmouse istances.

Thanks.

-- 
Dmitry
