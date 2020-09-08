Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5569D2623A5
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 01:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIHXjN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 19:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIHXjM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Sep 2020 19:39:12 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3D0C061573
        for <linux-input@vger.kernel.org>; Tue,  8 Sep 2020 16:39:11 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d6so485934pfn.9
        for <linux-input@vger.kernel.org>; Tue, 08 Sep 2020 16:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NHAcva3v7/gDLPqdCyq8gLV0KW1LmnJIEvPbKCNFrSw=;
        b=EpA2NInBYAca9Z0uTujOMK/yOkP+9OT8HCGmPi4cZGUrfLzKh5r9G7QGY2N+q43O3B
         kxiPn35LH8HWrSfr/va+OPW2gm4HQK736BGDhj0opO3+Dp+9rq3F4LXCTb/Nty5seXx2
         7F9fW5M9NXgKgz0ohYEG9F+jEtGS7xgryi9BqxW7UzmxXCNuIJ5WvrFWKxerjbqyVFHk
         oThh74JVFLCeZ2J0SMld1wt9j9OEeufOTBE6gZuDHFMxrA8V+6HYhm85V2HAIONIpnNP
         CKNMmDEzYAPsIncjI1hYUnkxu6sZqIe+goMJRSWwo6KQ3kexuviBSObkXq+HhpEtmx1k
         QxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NHAcva3v7/gDLPqdCyq8gLV0KW1LmnJIEvPbKCNFrSw=;
        b=sXg58698BxISHuZZtVuJqyf+jQQFyx18puvspZUQDjY38rkmO5kSXd0SMv02leaubD
         C3UMyMHbpkhJdzOjap1Yjhts4j1BoofquiAr7pXxXqVCNme2EhsiQysRRZDYKodrQ08D
         3HgWZCn7lv6Z9nvaErH8frMkVINlWey5HIFXxTK8N/rbcF91tmfK03oCfTg0lWMJCCRX
         7P6ddJRSxFSMt7KkMMmFRauNVTMBl8hLB9LltZwXdcTX+9HGrEcOb1qYcwoz64UzZQC1
         TnXV074xM8AYBPjR2WwQUIHE6o7bLFQN5xbnHH2Z1DG2ziKrefeyUrECx/r7O9joZOT4
         wVQQ==
X-Gm-Message-State: AOAM530Nyr/9QRSjc7Bdmsn0xKx/co+AlQKSz6H0ojRjY0M4Oc+LXktH
        TaS9osuqmaJKRibhPLQnwz/Pnfz1ZBo=
X-Google-Smtp-Source: ABdhPJwmvxSyXMENSQ0lx6S2boQndMaQF43UpuIIo+EUf2t74ZaHDiIf1Pb43pctKJIiWtHFr8YTYg==
X-Received: by 2002:a62:8349:: with SMTP id h70mr1113714pfe.47.1599608351424;
        Tue, 08 Sep 2020 16:39:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q127sm494102pfb.61.2020.09.08.16.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 16:39:10 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:39:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add Entroware Proteus EL07R4 to nomux and
 reset lists
Message-ID: <20200908233908.GB1665100@dtor-ws>
References: <20200907095656.13155-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907095656.13155-1-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 07, 2020 at 11:56:56AM +0200, Hans de Goede wrote:
> The keyboard drops keypresses early during boot unless both the nomux
> and reset quirks are set. Add DMI table entries for this.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1806085
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
