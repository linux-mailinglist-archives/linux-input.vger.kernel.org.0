Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6FA17EF58
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 04:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgCJDfQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 23:35:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40736 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgCJDfQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 23:35:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id l184so5810286pfl.7;
        Mon, 09 Mar 2020 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=UsKLLZJlVDtrPe5xEg/+FZGZJGjFT5GSHMdZWaRdoD8=;
        b=AZ61QXvQp0Dzlahin2n1vdFZNuW33b0FBH6M0RbYJE5FRndlM5KDGfLkUD+04e84sU
         s5ZhQP2CoPVmValx3pi4DwQjoabBFDVBXL6VX74sVlaYpWsQJQcfECmz8XymUAg1UeiN
         rzZOe9MMYwJZipxI59Rge91Y1uqKRz6TnRFBIL1dCg8laOkt1W4EkOUb365Lg4x6lFPH
         EQ1OncqCe3l9arK9e4ix7QX86LikmhcaXauyX8gHmIQpA1DqCcahONIbSj8zlYKuNriY
         tfC9yBHfHieYP2R3e+1J5E7qnhEQ8U5lHpNAwhzqj/DWyGv8tyEP6ncBs2l2BFF9rBO4
         9ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=UsKLLZJlVDtrPe5xEg/+FZGZJGjFT5GSHMdZWaRdoD8=;
        b=P5YNlg0QfeZ/J/Tg5rs3PYVQaqQ3iF0hjUFWfI0LIAMLZ8ecsM0/P17XoUIpQ2oogh
         l8+eXjRR5qcKr30OgPJ+6mx395Omv5mXxqgov5ct/T905wI2lqGLNYAMMfNrv67/AuUw
         aq5Mm99+5AnHJm1+9PA/T0ymRo6iQKQQjBpdvfeIzKzgtgll5VkbOweXu9tirBxQw6+Z
         ZcI9Gj4tqe8iDaE7IBAT1JmY+ipIUWAZkS4OA5+U1KHRpDyw9rqRP6ISJe1QckMwS6r/
         Iy6MciEd3QdpupGaZ20YJfKfCFR6aD+/Mr6d/8D1VHz3aCp3+NoMx3QcTfvsNXYdP1/f
         Q8zg==
X-Gm-Message-State: ANhLgQ2ukbBQfyY29tlzgzmaz+IoGEXOneLeu/BisbTKrxeQgAatDity
        guY/TxfCcoOxaHsK8wX9MpcU6bLU5x2iSQ==
X-Google-Smtp-Source: ADFU+vvgGwqfqvg0hDXCO/H6/tGYJkCeugxpM1FJ2RH/Sx1S2QUSFQ0+l86x/f6C2YfP8k6W0DjtwA==
X-Received: by 2002:a62:6842:: with SMTP id d63mr19731262pfc.113.1583811314285;
        Mon, 09 Mar 2020 20:35:14 -0700 (PDT)
Received: from [192.168.43.48] (111-82-208-34.emome-ip.hinet.net. [111.82.208.34])
        by smtp.gmail.com with ESMTPSA id 127sm26838729pfb.130.2020.03.09.20.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 20:35:13 -0700 (PDT)
Subject: Re: [PATCH] Input: i8042 - Fix the selftest retry logic
To:     AceLan Kao <acelan.kao@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200305064423.16196-1-acelan.kao@canonical.com>
From:   You-Sheng Yang <vicamo@gmail.com>
Autocrypt: addr=vicamo@gmail.com; keydata=
 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
 /7MpmAIm
Message-ID: <501e8224-e334-0aa8-41c0-8f67552e7069@gmail.com>
Date:   Tue, 10 Mar 2020 11:35:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305064423.16196-1-acelan.kao@canonical.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LW7Oz11Y9tAg0TcCYNrhCsftsoklY9fCc"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LW7Oz11Y9tAg0TcCYNrhCsftsoklY9fCc
Content-Type: multipart/mixed; boundary="8h1T6anCO9DjKWHDffTy8a8WugBTO9PEE"

--8h1T6anCO9DjKWHDffTy8a8WugBTO9PEE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020-03-05 14:44, AceLan Kao wrote:
> @@ -955,7 +954,9 @@ static int i8042_controller_selftest(void)
>  		dbg("i8042 controller selftest: %#x !=3D %#x\n",
>  		    param, I8042_RET_CTL_TEST);
>  		msleep(50);
> -	} while (i++ < 5);
> +	} while (++i < 5);
> +	if (i =3D=3D 5)
> +		return -ENODEV;

I would like to propose a V2 for this. The original logic allows
continuation to device probe when selftest returns a different value
than expected, and this is no longer available with this patch.

>  #ifdef CONFIG_X86
>  	/*
>=20

You-Sheng Yang


--8h1T6anCO9DjKWHDffTy8a8WugBTO9PEE--

--LW7Oz11Y9tAg0TcCYNrhCsftsoklY9fCc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEVhtdp+wXuXuqVL95S6BJ+2O0nE8FAl5nCu0ACgkQS6BJ+2O0
nE+X1ggA4/vv5kgbXflSnQtYXnfZJv4PWqAkg8OY/6UnDpZBWI3HvYFeRW5wEdJK
iU9Cf4Czkf/oUjQIpEa44liKHZQn5513FQXH2MrFGHhKTIt25J2461RMbgjlruaF
fm79FZXCGBuRuYnrkJI8jMV5b3x2WzkgZhaIvdBYsp2rAmjYyT8ERbrX6utcJ6d5
uFPAIlgohU01DQ/0vo89zOUY+5fu1iRFsJthMH+DzfPq9stMtqDfS7/728xGeyXl
2EAw92bmhUo4+Pi6IXLW6w1Xl1d3YhotlJslqLCcv4DsWT9xlW5fVCfQEN9yBcyu
tWgIpAl6AlhDZOLakqcnXPHKaEdcBg==
=Js16
-----END PGP SIGNATURE-----

--LW7Oz11Y9tAg0TcCYNrhCsftsoklY9fCc--
