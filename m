Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915C7432B9C
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 03:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhJSB54 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 21:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhJSB54 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 21:57:56 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734D5C06161C;
        Mon, 18 Oct 2021 18:55:44 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso797902pjb.4;
        Mon, 18 Oct 2021 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iVUwTST59wL6CTCRNw7c8eNLL6H7oNA2+TgO4Oeu8Y4=;
        b=W/pHLIdze3XNKJnt2F32rIzoajoraz7WOisrfpL79CoLKpEItyajbals9z4qH0/hSQ
         MsMbtVPgHEyXF9d7a3xx9ECfUPdJy2y579OmnaB/tB6WBX95IiVCR6MxX9PSuBAbn7MO
         zQwq05oS1sNCrzecgb6ysYxc7pc6bK+svtWUvUhrpbhDZ122h2OXN8AKTGwoZgbMyZIL
         hXgo8COOAhx79wDodOe6szSc8QUFQXW8scUbjGoyrW00w73tAi5VfY3dILcOfKlh6I4u
         jWAGRpBMBv06AErvnMP6nGKhZm3GxVX1GvKqmzwPJ75AlkysLku9NnFOTcylYAAb+T+e
         v9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iVUwTST59wL6CTCRNw7c8eNLL6H7oNA2+TgO4Oeu8Y4=;
        b=Vic9jXmOJy0nx5laFh2i9g7n3UlFi9D8GgVcciWQBn5NO+e9GrrfVA5WJZh6qaz5+5
         sHjiaKZmKm5qAk/zE/Gx38actAc7NQ8cukD1i6uHAjr9pv6jMIGCnO9zLgsGgD/iu5tx
         8TYeooVPwu83uUQqFf0CXpWNkUbwIf/hx11NHB8kKLskV+EBe2OeEqUfnRduFKWiYowe
         xGoXR8PbFpZ3jJd497ICTRthN4LhUxRSi4EY6mw0ijEB236vQ/AjW6Uvt4MJvTXfCZCE
         4BuH7yGi/jGyc/0HTsuFPXUWa2IVFDHeziF1YnWWqaYbE+Dw82XXrEVtaEKce801tPRD
         3l+A==
X-Gm-Message-State: AOAM5301AZw7FThN7hmNgJ4IjiMGDG5901bOv3lLsWp1/vYIvmqt8Ok5
        r67IpLyw8kcNlpG89t9LrvY=
X-Google-Smtp-Source: ABdhPJxOmf2YCoKcCsPO1gg9ffjbe92LAOAJFoagIEVGnqtsbTEoNeSqP8nBMw+HX1IC3RE1OOfYEg==
X-Received: by 2002:a17:90a:3ec2:: with SMTP id k60mr3075137pjc.176.1634608543794;
        Mon, 18 Oct 2021 18:55:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:54f8:9d9:1fa7:9eae])
        by smtp.gmail.com with ESMTPSA id oo9sm680504pjb.53.2021.10.18.18.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 18:55:42 -0700 (PDT)
Date:   Mon, 18 Oct 2021 18:55:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/3] Input: axp20x-pek - Use new soc_intel_is_cht() helper
Message-ID: <YW4lnI2fAWBlIQhw@google.com>
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018143324.296961-4-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 18, 2021 at 04:33:24PM +0200, Hans de Goede wrote:
> Use the new soc_intel_is_cht() helper to find out if we are running
> on a CHT device rather then checking the ACPI _HRV field.
> 
> This is more reliable (some CHT devices have been found where the _HRV
> for the PMIC is 2 rather then 3) and leads to a nice cleanup.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the patches.

Thanks.

-- 
Dmitry
