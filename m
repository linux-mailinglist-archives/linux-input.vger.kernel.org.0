Return-Path: <linux-input+bounces-4245-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA0901076
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 10:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BD0A1C21157
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 08:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1514A176AC8;
	Sat,  8 Jun 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhnDXmnS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BEDE556;
	Sat,  8 Jun 2024 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717836185; cv=none; b=pjXR8VS2DiOW7B7YwUoY5ONwpwvH1sbN9rYTDTxmm+E6GjwQISENzjM34+SwYfhxtVl17E+PtNE3x/ITnzi4OPvfTJKlAd6OfWwxY8OgVbM7iy4553zCdlhIdm0JRAjHqFu2t1JvsaX79DKtPfXzDdviUAaTnpFoyLpUpq2SED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717836185; c=relaxed/simple;
	bh=EqCVKZDIk6FDyFGl5sxCLIWYXrYbLWcXG0JefBSgnk8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sx/fWI73UZB/Dr/j6N+lMWuwpZ8cGyuBNTHpMtan/0ArKHRIaMXxZGKh13hUe5wx9Iti6GKrxzO4V6N8/ob+TEdN+2Dn2Wo2YzB4ovSh2dEEq/9wEzeXTnTkZt5snA1nnFLgojV2C+3mK51jPTsED7MWNn2Eybw4auVaK4unTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhnDXmnS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717836183; x=1749372183;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=EqCVKZDIk6FDyFGl5sxCLIWYXrYbLWcXG0JefBSgnk8=;
  b=LhnDXmnSXMDpEj6pf7OdpnYxewxQCiEDqppdoQkmXQ1KoS/xlKAWalIx
   yI+lp3xzXNvZHbZR4R6zMe4FVTGmbpHkAwU097UEIL4nN6TU1VJHAbtem
   jYjP+baENcB8q3p+NefvsLLyNL4w6bYnxvzX1VL26Rn3colj7h4bUwg8s
   Oc3E+7wlDEG4XF5YyUm1KrBiZLDUN5SqMZALF7aBAS2/87TqIbSw1qsbf
   0/x8JrJtZ2HXHN+iF5ELnIB8WtON515fHXjFfWNlZnvMulJRKvlCmnpX3
   JcAmxoqytIIAVkpg+YVaazqzbXbDVhsY+qfvHtl9TVAxIvECLqZrp3Ax6
   w==;
X-CSE-ConnectionGUID: Z1VOb1tHQfivRMycVuWIDg==
X-CSE-MsgGUID: l4sp/v17Rt2yEoAAjPMXOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14697122"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14697122"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 01:43:02 -0700
X-CSE-ConnectionGUID: FMBw9gggSNGLnjklFIzBgQ==
X-CSE-MsgGUID: C2qGwC5mRUKbW94NtTsHBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38993968"
Received: from anmitta2-mobl3.gar.corp.intel.com ([10.247.118.37])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 01:42:59 -0700
Message-ID: <80976997acb82fe3e6ba54fa2708c8f40fb3eb00.camel@linux.intel.com>
Subject: Re: [RFC] HID: ishtp-hid-client: replace fake-flex arrays with
 flex-array members
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Erick Archer <erick.archer@outlook.com>, Jiri Kosina <jikos@kernel.org>,
  Benjamin Tissoires <bentiss@kernel.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <keescook@chromium.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Date: Sat, 08 Jun 2024 01:42:54 -0700
In-Reply-To: <AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com>
References: 
	<AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-05-26 at 15:32 +0200, Erick Archer wrote:
> One-element arrays as fake flex arrays are deprecated [1] and we are
> moving towards adopting C99 flexible-array members, instead. This
> case
> also has more complexity because it is a flexible array of flexible
> arrays and this patch needs to be ready to enable the new compiler
> flag
> -Wflex-array-member-not-at-end (coming in GCC-14) globally.
>=20
> So, define a new struct type for the single reports:
>=20
> struct report {
> 	uint16_t size;
> 	struct hostif_msg_hdr msg;
> } __packed;
>=20
> but without the payload (flex array) in it. And add this payload to
> the
> "hostif_msg" structure. This way, in the "report_list" structure we
> can
> declare a flex array of single reports which now do not contain
> another
> flex array.
>=20
> struct report_list {
> 	[...]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct report reports[];
> } __packed;
>=20
> Also, use "container_of()" whenever we need to retrieve a pointer to
> the flexible structure, through which we can access the flexible
> array
> if needed.
>=20
> Moreover, refactor the code accordingly to use the new structures and
> take advantage of this avoiding some pointer arithmetic and using the
> "struct_size" helper when possible.
>=20
> This way, the code is more readable and safer.

Applied and tested, atleast didn't break anything.

But the explanation above didn't give me enough clue. You have added a
payload[] in the  struct hostif_msg {} then using that as a message
pointer following the header. I think this description needs to be
better.

Thanks,
Srinivas

>=20
> Link:
> https://www.kernel.org/doc/html/next/process/deprecated.html#zero-length-=
and-one-element-arrays
> =C2=A0[1]
> Closes: https://github.com/KSPP/linux/issues/333
> Signed-off-by: Erick Archer <erick.archer@outlook.com>
> ---
> Hi,
>=20
> The idea behind this patch is extracted from the ones sent by Gustavo
> A. R. Silva [1] but without the use of "struct_group_tagged()" helper
> to separate the flexible array from the rest of the members in the
> flexible structures.
>=20
> Regarding adding the "__counted_by" attribute to the flexible arrays,
> I can say that I have not dared. The reasons are:
>=20
> 1.- In both arrays there are a no direct assignment to the counter
> =C2=A0=C2=A0=C2=A0 member. Only exists a cast from a raw stream of bytes =
to a
> pointer
> =C2=A0=C2=A0=C2=A0 of a structure and this way the counter member has the=
 value.
>=20
> 2.- The outer flexible array (in the struct report_list) has elements
> =C2=A0=C2=A0=C2=A0 of different size. I believe that every report can hav=
e a
> different
> =C2=A0=C2=A0=C2=A0 size, so I think the "__counted_by" will not work as e=
xpected.
>=20
> Comments are welcome ;)
>=20
> Regards,
> Erick
>=20
> [1] Here are some patches that use the same idea:
> Link:
> https://lore.kernel.org/linux-hardening/cover.1709658886.git.gustavoars@k=
ernel.org/
> Link: https://lore.kernel.org/linux-hardening/ZgYWlkxdrrieDYIu@neat/
> Link: https://lore.kernel.org/linux-hardening/ZgG8bbEzhmX5nGRE@neat/
> ---
> =C2=A0drivers/hid/intel-ish-hid/ishtp-hid-client.c | 27 ++++++++++-------=
-
> --
> =C2=A0drivers/hid/intel-ish-hid/ishtp-hid.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 11 +++++---
> =C2=A02 files changed, 20 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> index fbd4f8ea1951..c0c8f4d7b0e3 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
> @@ -70,10 +70,10 @@ static void process_recv(struct ishtp_cl
> *hid_ishtp_cl, void *recv_buf,
> =C2=A0	unsigned char *payload;
> =C2=A0	struct device_info *dev_info;
> =C2=A0	int i, j;
> -	size_t	payload_len, total_len, cur_pos, raw_len;
> +	size_t	payload_len, total_len, cur_pos, raw_len, msg_len;
> =C2=A0	int report_type;
> =C2=A0	struct report_list *reports_list;
> -	char *reports;
> +	struct report *report;
> =C2=A0	size_t report_len;
> =C2=A0	struct ishtp_cl_data *client_data =3D
> ishtp_get_client_data(hid_ishtp_cl);
> =C2=A0	int curr_hid_dev =3D client_data->cur_hid_dev;
> @@ -99,7 +99,7 @@ static void process_recv(struct ishtp_cl
> *hid_ishtp_cl, void *recv_buf,
> =C2=A0		payload_len =3D recv_msg->hdr.size;
> =C2=A0
> =C2=A0		/* Sanity checks */
> -		if (cur_pos + payload_len + sizeof(struct
> hostif_msg) >
> +		if (cur_pos + struct_size(recv_msg, payload,
> payload_len) >
> =C2=A0				total_len) {
> =C2=A0			++client_data->bad_recv_cnt;
> =C2=A0			report_bad_packet(hid_ishtp_cl, recv_msg,
> cur_pos,
> @@ -280,14 +280,13 @@ static void process_recv(struct ishtp_cl
> *hid_ishtp_cl, void *recv_buf,
> =C2=A0		case HOSTIF_PUBLISH_INPUT_REPORT_LIST:
> =C2=A0			report_type =3D HID_INPUT_REPORT;
> =C2=A0			reports_list =3D (struct report_list
> *)payload;
> -			reports =3D (char *)reports_list->reports;
> +			report =3D reports_list->reports;
> =C2=A0
> =C2=A0			for (j =3D 0; j < reports_list-
> >num_of_reports; j++) {
> -				recv_msg =3D (struct hostif_msg
> *)(reports +
> -					sizeof(uint16_t));
> -				report_len =3D *(uint16_t *)reports;
> -				payload =3D reports + sizeof(uint16_t)
> +
> -					sizeof(struct
> hostif_msg_hdr);
> +				recv_msg =3D container_of(&report-
> >msg,
> +							struct
> hostif_msg, hdr);
> +				report_len =3D report->size;
> +				payload =3D recv_msg->payload;
> =C2=A0				payload_len =3D report_len -
> =C2=A0					sizeof(struct
> hostif_msg_hdr);
> =C2=A0
> @@ -304,7 +303,7 @@ static void process_recv(struct ishtp_cl
> *hid_ishtp_cl, void *recv_buf,
> =C2=A0						0);
> =C2=A0					}
> =C2=A0
> -				reports +=3D sizeof(uint16_t) +
> report_len;
> +				report +=3D sizeof(*report) +
> payload_len;
> =C2=A0			}
> =C2=A0			break;
> =C2=A0		default:
> @@ -316,12 +315,12 @@ static void process_recv(struct ishtp_cl
> *hid_ishtp_cl, void *recv_buf,
> =C2=A0
> =C2=A0		}
> =C2=A0
> -		if (!cur_pos && cur_pos + payload_len +
> -				sizeof(struct hostif_msg) <
> total_len)
> +		msg_len =3D struct_size(recv_msg, payload,
> payload_len);
> +		if (!cur_pos && cur_pos + msg_len < total_len)
> =C2=A0			++client_data->multi_packet_cnt;
> =C2=A0
> -		cur_pos +=3D payload_len + sizeof(struct hostif_msg);
> -		payload +=3D payload_len + sizeof(struct hostif_msg);
> +		cur_pos +=3D msg_len;
> +		payload +=3D msg_len;
> =C2=A0
> =C2=A0	} while (cur_pos < total_len);
> =C2=A0}
> diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.h
> b/drivers/hid/intel-ish-hid/ishtp-hid.h
> index 35dddc5015b3..2bc19e8ba13e 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-hid.h
> +++ b/drivers/hid/intel-ish-hid/ishtp-hid.h
> @@ -31,6 +31,7 @@ struct hostif_msg_hdr {
> =C2=A0
> =C2=A0struct hostif_msg {
> =C2=A0	struct hostif_msg_hdr	hdr;
> +	uint8_t payload[];
> =C2=A0} __packed;
> =C2=A0
> =C2=A0struct hostif_msg_to_sensor {
> @@ -52,15 +53,17 @@ struct ishtp_version {
> =C2=A0	uint16_t build;
> =C2=A0} __packed;
> =C2=A0
> +struct report {
> +	uint16_t size;
> +	struct hostif_msg_hdr msg;
> +} __packed;
> +
> =C2=A0/* struct for ISHTP aggregated input data */
> =C2=A0struct report_list {
> =C2=A0	uint16_t total_size;
> =C2=A0	uint8_t	num_of_reports;
> =C2=A0	uint8_t	flags;
> -	struct {
> -		uint16_t	size_of_report;
> -		uint8_t report[1];
> -	} __packed reports[1];
> +	struct report reports[];
> =C2=A0} __packed;
> =C2=A0
> =C2=A0/* HOSTIF commands */


