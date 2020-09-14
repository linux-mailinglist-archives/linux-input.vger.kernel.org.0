Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C393B26847B
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 08:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgINGKE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 02:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgINGJm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 02:09:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C180C06174A
        for <linux-input@vger.kernel.org>; Sun, 13 Sep 2020 23:09:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so11703493pff.6
        for <linux-input@vger.kernel.org>; Sun, 13 Sep 2020 23:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uaZjPjqWCQD/Ed1RGqIWbprfEMwWlt2j5KsiFs+XGh0=;
        b=LxgLXaJHRKl6kgNI+KfGTTHHE0bCOWOSlMnJDqN9r7cyLxk6vP5eX/ECvHEbeUJZjE
         nRZgmBt3OQ7BXkuFzfrXpCCcBCUEVho/kZHlllT9A/Hk/V33uJM2IEOzoZitD5HB4Gyi
         vSKdc3gK+t5wmeVQWfinj5ecrujnA7XOc2IyiGaruD8yN5HGmpDYTuAKGKfH/dM40oDT
         1AqyL98rUjzUuuwuxu6qSvFvMWOdh7GcxXrIjbC0NykKcgL8DgqOchTxJqY91QaonKRX
         h2Y62YKJGcwlB9qkueF4zCkGW9gD8naorVwU84SrjvUNaKKC+cacIwC+zdftOvNTQ+K6
         o4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uaZjPjqWCQD/Ed1RGqIWbprfEMwWlt2j5KsiFs+XGh0=;
        b=Y+5lOxwaaTlrI7AB2fLV+2cBvmjnH3reSUpIN+izmcuezRlF/JKywr/akfcuL/2mxl
         x1cPtOpzBOkLmHHAjbv1HAs0NFy14Q2juqtoGkUS9yOt+ZfdBFNmc/eT1CVVTUbxExRy
         neACO+xBDt53qwgfJo3Qdx47pgBK4eQHJq8hdm2E93OwRIHvoo7YDyS3bY38jkAb8/Er
         VuD1sAq11EsnBdL4IbWjZ9oNMoOZ7JdwaYhprty+T7ckuC7zBr4F6mrCfWxlh+fAXg+q
         wwd7qWoIIx2LbgjvshjI6+06lE9g+VWAj8AXqhfLuXoucEMkzSCo6Myjt+eoF7zrLPAL
         l85Q==
X-Gm-Message-State: AOAM533h+R/uiZPZmFNk7l7uEp8wgejz8xUCeWYWBhpb6Duyo3Dpv4GF
        XxDImv9c/3Yh6fbmRBopDRs=
X-Google-Smtp-Source: ABdhPJwMGl18TRILvErOQ1fK9hgAVrBlZZnSEbeVLtW2RnZIlewTXAcHcO/b3ZtU1kuN7hpDAlbWVw==
X-Received: by 2002:a63:1342:: with SMTP id 2mr9533368pgt.214.1600063780927;
        Sun, 13 Sep 2020 23:09:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 84sm9079892pfw.14.2020.09.13.23.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:09:40 -0700 (PDT)
Date:   Sun, 13 Sep 2020 23:09:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH resend 1/2] Input: soc_button_array - Add active_low
 setting to soc_button_info
Message-ID: <20200914060938.GL1665100@dtor-ws>
References: <20200826150601.12137-1-hdegoede@redhat.com>
 <20200826150601.12137-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826150601.12137-2-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 05:06:00PM +0200, Hans de Goede wrote:
> This is a preparation patch for adding support for Intel INT33D3
> ACPI devices. These INT33D3 devices follow yet another Intel defined
> (but not documented) ACPI GPIO button standard.
> 
> Unlike the ACPI GPIO button devices supported so far, the GPIO used in
> the INT33D3 devices is active-high, rather then active-low.
> 
> This commit makes setting the gpio_keys_button.active_low flag
> configurable through the soc_button_info struct and enables it for all
> currently supported devices.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
